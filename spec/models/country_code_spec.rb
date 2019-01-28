require 'rails_helper'

RSpec.describe CountryCode, type: :model do
  subject { described_class.new(attributes_for(:country_code)) }

  it 'is valid with valid attributes' do
    subject.name = 'country code'
    subject.code = '91'
    expect(subject).to be_valid
  end

  it 'is not valid without a code' do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate code' do
    country_code = FactoryGirl.create(:country_code)
    subject.code = country_code.code
    expect(subject).to_not be_valid
  end
end
