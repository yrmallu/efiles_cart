# E-File Cart

This is a simple e-commerce store that sells purely electronic products/files (for example, PDFs) using Ruby on Rails.

## Prerequisites

1) `Ruby version > 2.3`
2) `Rails version > 5`
3) `psql (PostgreSQL)`
4) `ImageMagick`
5) `Authy API key (optional) as per requirement`


## Installation

1) `git clone ...`
2) `cd efiles_cart`
3) `bundle install`
4) `rake db:setup`
5) `rake db:seed`
6) `rails s`
7) `bundle exec rake sunspot:solr:start`

## Test

`rspec spec`
