require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:product) { create(:product) }
  let(:cart) { create(:cart) }

  describe "POST #add" do
    before do
      @request.session[:cart_id] = cart.id
    end

    context "valid product" do
      it "add product to the cart" do
        post :add, params: {product_id: product.id}
        cart.reload
        expect(cart.product_count).to eq(1)
      end
    end

    context "invalid product" do
      it "returns product doesn't exist" do
        post :add, params: {product_id: 123}
        expect(response.status).to eq(200)
        expect(response.body).to eq({message: 'Product is no more exist.'}.to_json)
      end
    end

    context "product already present" do
      it "returns product already exist" do
        cart_product = create(:cart_product, product: product, cart: cart )
        post :add, params: {product_id: product.id}
        expect(response.status).to eq(200)
        expect(response.body).to eq({message: 'Product is already present in your cart.'}.to_json)
      end
    end
  end

  describe "GET #show" do
    context "cart_id present in session" do
      it "find cart with session" do
        @request.session[:cart_id] = cart.id
        get :show
        expect(assigns(:cart)).to eq(cart)
      end
    end

    context "cart_id not present in session" do
      it "find cart with session" do
        get :show
        expect(assigns(:cart)).to be_nil
      end
    end
  end

  describe "DELETE #remove_product" do
    context "with valid cart" do
      let(:new_cart) { create(:cart, product_count: 1) }

      before do
        @request.session[:cart_id] = new_cart.id
      end

      it "product exist in cart" do
        cart_product = create(:cart_product, product: product, cart: new_cart )
        delete :remove_product, params: {product_id: cart_product.id}
        new_cart.reload
        expect(new_cart.product_count).to eq(0)
      end

      it "product does not exist in cart" do
        cart_product = create(:cart_product, product: product, cart: new_cart )
        delete :remove_product, params: {product_id: 123}
        new_cart.reload
        expect(new_cart.product_count).to eq(1)
      end
    end

    context "with invalid cart" do
      it "cart does not exist" do
        delete :remove_product, params: {product_id: 123}
        cart.reload
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
