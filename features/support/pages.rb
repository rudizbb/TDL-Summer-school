class Pages
  attr_accessor :discordpage, :login, :users, :usermanager, :home

  def initialize
    @login ||= LoginPage.new
    @home ||= HomePage.new
  end
end