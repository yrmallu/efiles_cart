require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  before do
    login_admin
    allow(subject).to receive(:authenticate_user!).and_return(true)
    allow(subject).to receive(:validate_admin).and_return(true)
  end

  describe "GET #index" do
    it "assigns all categories as @categories" do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET #new" do
    it "assigns a new category as @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "GET #edit" do
    it "assigns the requested category as @category" do
      category = create(:category)
      get :edit, params: {id: category.to_param}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new category" do
        expect {
          post :create, params: {category: attributes_for(:category)}
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, params: {category: attributes_for(:category)}
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it "redirects to the created category" do
        post :create, params: {category: attributes_for(:category)}
        expect(response).to redirect_to(admin_categories_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        post :create, params: {category: attributes_for(:invalid_category)}
          expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        post :create, params: {category: attributes_for(:invalid_category)}
        expect(response).to render_template("new")
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{ name: 'new category' }}

      it "updates the requested category" do
        category = create(:category)
        put :update, params: {id: category.to_param, category: new_attributes}
        category.reload
        expect(category.attributes).to include( { 'name' => 'new category' } )
      end

      it "assigns the requested category as @category" do
        category = create(:category)
        put :update, params: {id: category.to_param, category: attributes_for(:category)}
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the category" do
        category = create(:category)
        put :update, params: {id: category.to_param, category: attributes_for(:category)}
        expect(response).to redirect_to(admin_categories_url)
      end
    end

    context "with invalid params" do
      it "assigns the category as @category" do
        category = create(:category)
        put :update, params: {id: category.to_param, category: attributes_for(:invalid_category)}
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the 'edit' template" do
        category = create(:category)
        put :update, params: {id: category.to_param, category: attributes_for(:invalid_category)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = create(:category)
      expect {
        delete :destroy, params: {id: category.to_param}
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categorys list" do
      category = create(:category)
      delete :destroy, params: {id: category.to_param}
      expect(response).to redirect_to(admin_categories_url)
    end
  end
end
