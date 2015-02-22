require 'watir-webdriver'

Given('User on the Log in page') do
  @b = Watir::Browser.start 'https://twitter.com/login'
end

When('User enters the invalid data') do
  login_field = @b.text_field name: 'session[username_or_email]'
  login_field.when_present.set 'invalid_login'

  password_field = @b.text_field name: 'session[password]'
  password_field.when_present.set 'invalid_password'
end

And('User turns log in') do
  @b.button(:class => "submit btn primary-btn").click
end

Then('User should see error message') do
  puts 'User is on the ' + @b.url
  @b.close
end

When('User enters the existing data') do
  login_field = @b.text_field name: 'session[username_or_email]'
  login_field.when_present.set 'vadimpetkevich'

  password_field = @b.text_field name: 'session[password]'
  password_field.when_present.set '290514VUS903657'
end

Then('User should see him page') do
  puts 'User is on the ' + @b.url
  @b.close
end



