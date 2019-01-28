require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  before(:each) do
    @product = create(:product)
  end

  it "renders the edit admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(@product), "post" do

      assert_select "input#product_title[name=?]", "product[title]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "select#product_product_type_id[name=?]", "product[product_type_id]"

      assert_select "input#product_no_of_pages[name=?]", "product[no_of_pages]"

      assert_select "input#product_publisher[name=?]", "product[publisher]"

      assert_select "input#product_isbn[name=?]", "product[isbn]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_writer_name[name=?]", "product[writer_name]"
    end
  end
end
