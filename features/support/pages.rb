class Pages
  attr_accessor :discordpage, :login, :users, :usermanager

  def initialize
    @login ||= LoginPage.new
  end
end