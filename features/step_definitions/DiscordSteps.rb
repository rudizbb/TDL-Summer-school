Given(/^I am on Discord home page$/) do
    @pages.login.load_home_page
end

When(/^I login as (.*)/) do |user|
    file = YAML.load_file('config/test_data.yml')
    case user
    when 'user1' then
      $user_manager.current_user = 'user1'
      @pages.login.fill_form(file['user1'])
      sleep 1
    when 'user2' then
      $user_manager.current_user = 'user2'
      @pages.login.fill_form(file['user2'])
    else
      raise 'Login is not correct!'
    end
end

And(/^I click on skip the tutorial$/) do
    @pages.login.skipButton.click
end

Then(/^I see that login was successful$/) do
    expect(page).to have_css(".home-icon")
    sleep 3
end

And(/^I Start a New Chat$/) do
    @pages.login.friendsTab.visible?
    @pages.login.friendsTab.click
    @pages.login.friendTag.visible?
    @pages.login.friendTag.click
end

And(/^I Send a Chat Message with text (.*)/) do |text_message|
    @pages.login.chatMessageInput.visible?
    @pages.login.chatMessageInput.send_keys(text_message)
    find(@pages.login.chatMessageInput.css).set("\n")
    expect(page).to have_text(text_message)
    sleep 3
end

And(/^I Start a 30 Second Voice Call$/) do
    @pages.login.voiceCallButton.click
    sleep 30
    @pages.login.leaveCallButton.click
    expect(page).to have_text("started a call")
    sleep 3
end

And(/^I log out from Discord App$/) do
    @pages.login.userSettings.click
    @pages.login.logOutButton.click
    @pages.login.logOutConfirm.click
end

Then(/^I have successfully logged out$/) do
    expect(page).to have_css(@pages.login.email)
    expect(page).to have_css(@pages.login.password)
    sleep 3
end

