require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  let(:user) { create(:user) }
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }
  let(:cart_product) { create(:cart_product, product: product) }

  before do
    sign_in user
    user.cart = cart
    cart.cart_products.push(cart_product)
  end

  describe "GET #index" do
    it "renders checkout index" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "POST #request_authy_token" do
    context "valid response" do
      it "renders verify_authy_token template" do
        mock_response = OpenStruct.new('ok?': true, 'approval_request' => {'uuid' => '123'})
        expect(Authy::OneTouch).to receive(:send_approval_request).and_return(mock_response)
        post :request_authy_token
        expect(response).to render_template('checkout/verify_authy_token')
      end
    end

    context "invalid response" do
      it "renders index template" do
        mock_response = OpenStruct.new('ok?': false, errors: 'message')
        expect(Authy::OneTouch).to receive(:send_approval_request).and_return(mock_response)
        post :request_authy_token
        expect(response).to render_template('index')
      end
    end
  end

  describe "POST #process_order" do
    context "valid response" do
      it "place order" do
        expect(SendProductDocMailer).to receive_message_chain(:send_product_email, :deliver_later).and_return(true)
        expect(Authy::API).to receive_message_chain(:verify, :ok?).and_return(true)
        post :process_order, params: { uuid: 1234, token: 1245678 }
        expect(response).to render_template('checkout/order_success')
      end
    end

    context "invalid response" do
      it "redirect to checkout index" do
        expect(Authy::API).to receive_message_chain(:verify, :ok?).and_return(false)
        post :process_order, params: { uuid: 1234, token: 1245678 }
        expect(response).to redirect_to(checkout_init_path)
      end
    end
  end

end
