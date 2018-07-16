Given(/^I am on login page$/) do
  @pages.login.load_home_page
end

When(/^I open PartsAdvisor website$/) do
  @pages.login.load_home_page
end

=begin
When(/^I login as repairer using password (.*)$/) do |password|
    @pages.login.fill_form(file['repairer'])
=end

When(/^I press on Forgotten password button$/) do
  @pages.login.forgottenPassword.click
end

When(/^I enter (.*) recovery email$/) do |user|
  file = YAML.load_file('config/test_data.yml')
  case user
  when 'admin' then
    @pages.login.fill_recovery_form(file['admin'])
  when 'repairer' then
    @pages.login.fill_recovery_form(file['repairer'])
  when 'retailer' then
    @pages.login.fill_recovery_form(file['retailer'])
  when 'distributor' then
    @pages.login.fill_recovery_form(file['distributor'])
  when 'distributor2' then
    @pages.login.fill_recovery_form(file['distributor2'])
  when 'pivi_repairer' then
    @pages.login.fill_recovery_form(file['pivi_repairer'])
  when 'pivi_retailer' then
    @pages.login.fill_recovery_form(file['pivi_retailer'])
  when 'blusys_repairer' then
    @pages.login.fill_recovery_form(file['blusys_repairer'])
  when 'blusys_retailer' then
    @pages.login.fill_recovery_form(file['blusys_retailer'])
  when 'recalvi_repairer' then
    @pages.login.fill_recovery_form(file['recalvi_repairer'])
  else
    raise 'Login user is not correct!'
  end
end

When(/^I press on Send button to send recovery e-mail$/) do
  @pages.login.sendRecoveryButton.click
end

Then(/^I see confirmation$/) do
  @pages.login.emailConfirm.visible?
end

When(/^I sign in with invalid data$/) do
  @pages.login.email.send_keys 'qa1mario2@yopmail.com'
  @pages.login.password.send_keys 'AllParts12'
  @pages.login.send.click
end

When(/^I sign out$/) do
  if $user_manager.current_user =="admin"
    @pages.admin.headerDropdown.click
    @pages.admin.logout.click
    sleep 1
  else
  @pages.repairerheader.dropdown.click
  @pages.repairerheader.logout.click
    end
end

When(/^I sign out from side menu$/) do
  to_personal_details
  @pages.retailersidemenu.logOut.click
  expect(page).to have_css(@pages.login.send.css)
end

Then(/^I see wrong password error$/) do
  @pages.login.loginerror.visible?
end

When(/^I enter email$/) do
  @pages.login.email.send_keys "auto1jacquieauto1@mailserver.tdlbox.com"
end

Then(/^I see email field with email entered$/) do
  assert_equal("auto1jacquieauto1@mailserver.tdlbox.com", @pages.login.email.value)
end

When(/^I login using email "(.*?)" password "(.*?)"$/) do |email, password|

# GET TO CORRECT PAGE
  $user_manager.current_user = 'repairer'
  @pages.login.email.visible?
  @pages.login.email.send_keys email
  @pages.login.password.send_keys password
  @pages.login.send.click
end


Then(/^I check account registration$/) do
  @pages.login.signup.click
  assert_equal("Registration form", @pages.login.registrationFormText.text)
  assert_equal("Car repairer", @pages.login.carRepairerText.text)
  assert_equal("Retailer", @pages.login.retailerText.text)
  assert_equal("Company name", @pages.login.companyNameText.text)
  assert_equal("E-mail address", @pages.login.registrationEMailAddressText.text)
  assert_equal("Phone number", @pages.login.phoneNumberText.text)
  assert_equal("VAT number", @pages.login.VATnumberText.text)
  assert_equal("I accept the general terms of use and I agree with the general sales conditions",
               @pages.login.acceptTOSText.text)
  assert_match("parts-advisor.com/medias/documents/conditions/conditions-of-use-en-US.pdf", first(@pages.login.acceptTOSlink.css)['href'])
  @pages.login.carRepairer.click
  @pages.login.companyName.send_keys "test"
  @pages.login.registrationEMailAddress.send_keys "test@yopmail.com"
  @pages.login.phoneNumber.send_keys "+37129359902"
  @pages.login.VATnumber.send_keys "29652165"
  @pages.login.acceptTOS.click
  @pages.login.SendRegistrationRequest.click
  @pages.login.ConfirmRegistration.click
end

Then(/^I check account registration negative$/) do
  @pages.login.signup.click
  assert_equal("Registration form", @pages.login.registrationFormText.text)
  assert_equal("Car repairer", @pages.login.carRepairerText.text)
  assert_equal("Retailer", @pages.login.retailerText.text)
  assert_equal("Company name", @pages.login.companyNameText.text)
  assert_equal("E-mail address", @pages.login.registrationEMailAddressText.text)
  assert_equal("Phone number", @pages.login.phoneNumberText.text)
  assert_equal("VAT number", @pages.login.VATnumberText.text)
  assert_equal("I accept the general terms of use and I agree with the general sales conditions",
               @pages.login.acceptTOSText.text)

  assert_match("parts-advisor.com/medias/documents/conditions/conditions-of-use-en-US.pdf", first(@pages.login.acceptTOSlink.css)['href'])

  @pages.login.companyName.send_keys "test"
  @pages.login.registrationEMailAddress.send_keys "test@yopmail.com"
  @pages.login.phoneNumber.send_keys "+37129359902"
  @pages.login.VATnumber.send_keys "29652165"
  assert_false(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.acceptTOS.click
  @pages.login.carRepairer.click
  assert_true(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.registrationEMailAddress.send_keys "test@test"
  assert_false(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.registrationEMailAddress.set ""
  @pages.login.registrationEMailAddress.send_keys "test@yopmail.com"
  @pages.login.phoneNumber.set ""
  assert_true(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.companyName.set ""
  assert_false(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.companyName.send_keys "test"
  assert_true(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.VATnumber.set ""
  assert_false(@pages.login.SendRegistrationRequest.enabled?)
  @pages.login.VATnumber.send_keys "29652165"
  @pages.login.SendRegistrationRequest.click
  @pages.login.ConfirmRegistration.click
end