require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  before do
    login_admin
    allow(subject).to receive(:authenticate_user!).and_return(true)
    allow(subject).to receive(:validate_admin).and_return(true)
  end

  describe "GET #index" do
    it "assigns all products as @products" do
      product = create(:product)
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product as @product" do
      product = create(:product)
      get :edit, params: {id: product.to_param}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: attributes_for(:product)}
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, params: {product: attributes_for(:product)}
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        post :create, params: {product: attributes_for(:product)}
        expect(response).to redirect_to(admin_products_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, params: {product: attributes_for(:invalid_product)}
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, params: {product: attributes_for(:invalid_product)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{ title: 'new product' }}

      it "updates the requested product" do
        product = create(:product)
        put :update, params: {id: product.id, product: new_attributes}
        product.reload
        expect(product.attributes).to include( { 'title' => 'new product' } )
      end

      it "assigns the requested product as @product" do
        product = create(:product)
        put :update, params: {id: product.to_param, product: attributes_for(:product)}
        expect(assigns(:product)).to eq(product)
      end

      it "redirects to the product" do
        product = create(:product)
        put :update, params: {id: product.to_param, product: attributes_for(:product)}
        expect(response).to redirect_to(admin_products_url)
      end
    end

    context "with invalid params" do
      it "assigns the product as @product" do
        product = create(:product)
        put :update, params: {id: product.to_param, product: attributes_for(:invalid_product)}
        expect(assigns(:product)).to eq(product)
      end

      it "re-renders the 'edit' template" do
        product = create(:product)
        put :update, params: {id: product.to_param, product: attributes_for(:invalid_product)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = create(:product)
      expect {
        delete :destroy, params: {id: product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = create(:product)
      delete :destroy, params: {id: product.to_param}
      expect(response).to redirect_to(admin_products_url)
    end
  end

end
