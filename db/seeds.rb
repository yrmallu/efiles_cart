# Create product types
ProductType.create({ name: 'eBooks' }) if ProductType.where(name: 'eBooks').blank?

# Add country code
country_codes = {
  'India' => 91,
  'Afghanistan' => 93,
  'Albania' => 355,
  'Algeria' => 213,
  'Australia' => 61,
  'Saudi Arabia' => 966,
  'United Arab Emirates' => 971,
  'United Kingdom' => 44,
  'United States' => 1,
  'Syria' => 963,
  'Switzerland' => 41,
  'New Zealand' => 64,
  'Iraq' => 964,
  'Iran' => 98
}

country_codes.each do |name, code|
  CountryCode.create({ name: name, code: code }) if CountryCode.where(name: name).blank?
end

india_code = CountryCode.where(name: 'India').first

# Create admin user
if User.where(email: 'example@gmail.com').blank?
  user_params = {
    email: 'example@gmail.com', password: '123456@Yedu',
    admin_role: true, name: 'Admin' ,cellphone: '9665833175',
    country_code_id: india_code.id
  }
  User.create(user_params)
end
