Given("I'm on the Log in page") do
  @b = Watir::Browser.start 'https://vk.com'
end

When('I enter the invalid data') do
  login_field = @b.text_field name: 'email'
  login_field.wait_until_present
  login_field.set 'invalid_login'

  password_field = @b.text_field name: 'pass'
  password_field.wait_until_present
  password_field.set 'invalid_password'
end

And('I turn log in') do
  login_button = @b.button(:id => "quick_login_button")
  login_button.wait_until_present
  login_button.click
end

Then('I should see error message') do
  @b.div(class: 'login_msg').wait_until_present
  @b.close
end

When('I enter the existing data') do
  login_field = @b.text_field name: 'email'
  login_field.wait_until_present
  login_field.set LOGIN

  password_field = @b.text_field name: 'pass'
  password_field.wait_until_present
  password_field.set PASSWORD
end

Then('I should see my page') do
  @b.td(id: 'logout_link_td').wait_until_present
  @b.close
end