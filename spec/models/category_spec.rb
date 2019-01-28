require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(attributes_for(:category)) }

  it 'is valid with valid attributes' do
    subject.name = 'category1'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    category = FactoryGirl.create(:category)
    subject.name = category.name
    expect(subject).to_not be_valid
  end
end
