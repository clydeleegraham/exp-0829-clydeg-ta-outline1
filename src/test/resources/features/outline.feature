Feature: Scenario Outline Feature

  @quote
  @outline
  Scenario Outline: Quote-QA tests with datasets
    Given I open url "http://quote-qa.portnov.com"
    Then I type "<fullname>" into element with xpath "//input[@id='name']"
    Then I wait for 5 sec
    And I type "<username>" into element with xpath "//input[@name='username']"
    And I type "<email>" into element with xpath "//input[@name='email']"
    And I type "<password>" into element with xpath "//input[@name='password']"
    And I type "<password>" into element with xpath "//input[@name='confirmPassword']"
    And I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
    And I click on element with xpath "//button[@name='formSubmit']"


    Examples:
      |fullname     | username        | email               | password     |
      |Artem        | artemoganesyan  | test@example.com    | 123456       |
      |Artem Og     | test&^%21       | test11@example.com  | 123456&^%    |
      |Artem 32     | test-with-dash  | test11@example      | dfFDH123     |
      |Clyde Graham | clydeg          | test123@example.com | Passw0rd123! |

  @nop
  @e2e
  @outline
  Scenario Outline: NOP-QA Guest Purchase E2E test with datasets (BDD)
  # This code (mostly) works, but is not decent BDD
  # Future: Refactor for BDD

    Given I open url "https://nop-qa.portnov.com"
    And I wait for element with xpath "//div[@class='header-logo']/a/img" to be present
    And I should see page title contains "Your store"
    # Then I wait for 2 sec

    Then I click on "Books" in the top menu
    And I should see page title contains "Books"
    # Then I wait for 2 sec

    Then I click on element using JavaScript with xpath "//*/h2/a[contains (text(), 'Fahrenheit')]"
    Then I wait for element with xpath "//div/span[contains (text(), 'FR_451_RB')]" to be present

    Then I click on element using JavaScript with xpath "//div/button[@id='add-to-cart-button-37']"
    And I click on element using JavaScript with xpath "//span[contains(text(),'Shopping cart')]"

    Then I wait for 2 sec
    And I should see page title contains "Shopping Cart"

    Then I wait for 2 sec
    And I click on element using JavaScript with xpath "//div/input[@id='termsofservice']"
    # Note, sometimes this fails. Perhaps it's taking too long

    Then I wait for 2 sec
    And I click on element using JavaScript with xpath "//div/button[@id='checkout']"
    And I click on element using JavaScript with xpath "//div/button[@class='button-1 checkout-as-guest-button']"

    Then I wait for 2 sec
    And I should see page title contains "Checkout"

    Then I type "<firstname>" into element with xpath "//div/input[@id='BillingNewAddress_FirstName']"
    And I type "<lastname>" into element with xpath "//div/input[@id='BillingNewAddress_LastName']"
    And I type "<email>" into element with xpath "//div/input[@id='BillingNewAddress_Email']"

    Then I select the Country dropdown
    And I select United States of America from the Country dropdown

    Then I type "<City>" into element with xpath "//div/input[@id='BillingNewAddress_City']"
    And I type "<Address 1>" into element with xpath "//div/input[@id='BillingNewAddress_Address1']"
    And I type "<Zip Code>" into element with xpath "//div/input[@id='BillingNewAddress_ZipPostalCode']"
    And I type "<Phone Number>" into element with xpath "//div/input[@id='BillingNewAddress_PhoneNumber']"
    Then I wait for 2 sec
    
    Then I click on element using JavaScript with xpath "//div/button[1][@class='button-1 new-address-next-step-button']"
    Then I wait for 2 sec
#   Above should take me to next step, somewhere other than 'Checkout'
#   but it appears Checkout as Guest is not implemented at this time

#   So I have a check to make sure that I am not returned to the Checkout page
#   Future: wrap in try catch instead
    Then I should see page title does not contain "Checkout"
#   Above statement SHOULD fail, but it is clearly returning me to Checkout and passing
#   I do not yet understand why
    
  Examples:
    | firstname | lastname  | email                | Country       | City | Address 1    | Zip Code | Phone Number |
    | Clyde     | Graham1   | test1234@example.com | United States | York | 123 Main St. | 17402    | 7175551212   |
    | Clyde     | Graham2   | test2345@example.com | United States | York | 123 Main St. | 17402    | 7175551212   |
    | Clyde     | Graham3   | test3456@example.com | United States | York | 123 Main St. | 17402    | 7175551212   |
    | Clyde     | Graham4   | test4567@example.com | United States | York | 123 Main St. | 17402    | 7175551212   |
