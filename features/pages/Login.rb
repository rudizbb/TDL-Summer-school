require_relative '../../features/pages/base'
# Login page class
class LoginPage < BasePage
  attr_accessor :email, :password, :loginButton, :skipButton, :homeButton, :friendsTab, :friendTag, :voiceCallButton
  attr_accessor :chatMessageInput, :leaveCallButton, :userSettings, :logOutButton

  def initialize
    @email = Element.new(:xpath, "/html/body/div/div[1]/div/div[2]/div/form/div/div[3]/div[1]/div/input")

    @password = Element.new(:xpath, "/html/body/div/div[1]/div/div[2]/div/form/div/div[3]/div[2]/div/input")

    @loginButton = Element.new(:xpath, "/html/body/div/div[1]/div/div[2]/div/form/div/div[3]/button[2]")

    @skipButton = Element.new(:xpath, "/html/body/div/div[4]/div[2]/div/form/div/button[1]")

    @homeButton = Element.new(:css,".home-icon")

    @friendsTab = Element.new(:xpath,"//*[@id='app-mount']/div[1]/div/div[1]/div/div/div[2]/div[2]/div[1]/div[1]/div[2]/div/span/div[2]")

    @friendTag = Element.new(:css,".discord-tag")   

    @voiceCallButton = Element.new(:css,"div.alignCenter-1dQNNs:nth-child(3) > div:nth-child(1) > svg:nth-child(2)")

    @leaveCallButton = Element.new(:xpath,"//*[@id='app-mount']/div[1]/div/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/div/div[2]/div[3]/div/div[2]/button[3]/div")
  
    @chatMessageInput = Element.new(:css,"div.chat.flex-vertical.flex-spacer.private > div.content.flex-spacer.flex-horizontal > div > form > div > div > textarea")

    @userSettings = Element.new(:xpath,"//*[@id='app-mount']/div[1]/div/div[1]/div/div/div[2]/div[2]/div[1]/div[2]/div[3]/div[3]")

    @logOutButton = Element.new(:xpath,"//*[@id='app-mount']/div[1]/div/div[1]/div[2]/div/div[1]/div/div/div/div/div[19]")

    @logOutConfirm = Element.new(:xpath,"//*[@id='app-mount']/div[4]/div[2]/div/form/div[3]/button[1]")
  end

  def fill_form(user)
    @email.visible?
    @email.click
    @email.send_keys user['email']
    @password.click
    @password.send_keys user['password']
    @loginButton.click
  end

  def load_home_page
    visit ''
  end
end