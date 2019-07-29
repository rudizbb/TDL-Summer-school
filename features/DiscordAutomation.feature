@cucumber
Feature: Sign in features

    @signin
    Scenario: Sign in Discord Web App
        Given I am on Discord home page
        And I login as user1
        And I click on skip the tutorial
        Then I see that login was successful

    @chat
    Scenario: Send a Chat Message
        Given I am on Discord home page
        And I login as user1
        Then I see that login was successful
        And I Start a New Chat
        And I Send a Chat Message with text test112

    @call
    Scenario: Make a 30 second Call With Another User
        Given I am on Discord home page
        And I login as user1
        And I Start a New Chat
        And I Start a 30 Second Voice Call

    @signout
    Scenario: Log out from Discord Web App
        Given I am on Discord home page
        And I login as user1
        And I log out from Discord App
        Then I have successfully logged out
