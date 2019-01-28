require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.new(attributes_for(:product)) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a file' do
    subject.product_file = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate title' do
    product = FactoryGirl.create(:product)
    subject.title = product.title
    expect(subject).to_not be_valid
  end
end
