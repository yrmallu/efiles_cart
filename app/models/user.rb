class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :register_in_authy_and_send_mail

  before_destroy :destroy_authy_user

  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create

  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  validates :name, presence: true

  validates :cellphone, presence: true, uniqueness: true

  validates :country_code_id, presence: true

  has_one :cart

  belongs_to :country_code

  has_many :orders

  def register_in_authy_and_send_mail
    UserMailer.send_welcome_email(self).deliver_later

    authy = Authy::API.register_user(email: self.email, cellphone: self.cellphone, country_code: self.country_code.code.to_s)
    if authy.ok?
      self.authy_id = authy.id
      self.save!
    else
      fail authy.errors
    end
  end

  def destroy_authy_user
    return if self.authy_id == 0
    response = Authy::API.delete_user(:id => self.authy_id)
    unless response.ok?
      fail response.errors
    end
  end
end
