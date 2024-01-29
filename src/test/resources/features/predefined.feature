@predefined
Feature: Smoke steps

  @predefined1
  @regression
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I wait for 2 sec
    Then I should see page title as "Google"
    Then I wait for 5 sec
    Then I type "Cucumber" into element with xpath "//textarea[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for 2 sec
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then I should see page title contains "- Google Search"
    Then I wait for 2 sec
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"





