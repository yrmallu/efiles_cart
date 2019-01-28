class SendProductDocMailer < ApplicationMailer
  default from: 'example@gmail.com'
  after_action :set_order_status

  def send_product_email(user, order, order_product, product)
    @user = user
    @product = product
    @order = order
    @order_product = order_product
    product_path = @product.product_file.path
    file_name = @product.product_file.original_filename
    file_name.gsub!(/\s+/, '')
    attachments[file_name] = File.read(product_path) if File.file?(product_path)
    mail(to: @user.email, subject: "Order #{@order.id}: Your e-file from E-File Cart!")
  end

  def set_order_status
    if @order_product.present?
      @order_product.update_attribute(:status, 'completed')
    end
  end
end
