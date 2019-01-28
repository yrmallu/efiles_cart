require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(attributes_for(:user)) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cellphone' do
    subject.cellphone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a country_code_id' do
    subject.country_code_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    user = FactoryGirl.create(:user)
    subject.email = user.email
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate cellphone' do
    user = FactoryGirl.create(:user)
    subject.cellphone = user.cellphone
    expect(subject).to_not be_valid
  end
end
