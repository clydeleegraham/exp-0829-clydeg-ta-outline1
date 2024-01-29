Feature: WebDriver feature

  @quote-qa
  @smoke
  Scenario: (Smoke Test)

    Given I open url "https://quote-qa.portnov.com/"
    Then I wait for element with xpath "//title[contains(text(),'Get a Quote')]" to be present
    Then I type "clydegraham" into element with xpath "//*[@name='username']"
    Then I type "Clyde Lee Graham" into element with xpath "//*[@name='name']"
    Then I type "test123@example.com" into element with xpath "//*[@name='email']"
    Then I wait for 1 sec
    Then I type "Password123!" into element with xpath "//*[@id='password']"
    Then I type "Password123!" into element with xpath "//*[@id='confirmPassword']"
    Then I wait for 1 sec
    Then I click on element using JavaScript with xpath "//*[@name='agreedToPrivacyPolicy']"
    Then I click on element using JavaScript with xpath "//*[@id='formSubmit']"
    Then I wait for element with xpath "//*[@id='quotePageResult']" to be present
    And I wait for element with xpath "//button[@id='return']" to be present
    Then I wait for 1 sec
    Then I take screenshot
    Then I click on element using JavaScript with xpath "//button[@id='return']"
    Then I wait for element with xpath "//title[contains(text(),'Get a Quote')]" to be present
