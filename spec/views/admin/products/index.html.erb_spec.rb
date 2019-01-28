require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:products, [
      create(:product, title: 'Product1' ),
      create(:product, title: 'Product2')
    ])
  end

  it "renders a list of admin/products" do
    render
    assert_select "tr>td", :text => "Product1".to_s
    assert_select "tr>td", :text => "Product2".to_s
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => "$120.00", :count => 2
    assert_select "tr>td", :text => "test publisher".to_s, :count => 2
  end
end
