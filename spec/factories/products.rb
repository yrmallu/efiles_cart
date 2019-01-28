require 'rack/test'

FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "product#{n}" }
    description "MyText"
    no_of_pages 12
    publisher 'test publisher'
    publication_date Time.now
    isbn '124563'
    price 120
    writer_name 'test writer'
    out_of_stock false
    image { Rack::Test::UploadedFile.new(Rails.root.join('fixtures', 'test.png'), 'image/png') }
    product_file { Rack::Test::UploadedFile.new(Rails.root.join('public', 'ebook.pdf'), 'application/pdf') }
  end

  factory :invalid_product, class: :Product do
    title nil
  end
end
