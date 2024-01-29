package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import static support.TestContext.driver;
import static support.TestContext.getDriver;

public class nopStepDefs {

    @Then("I click on {string} in the top menu")
    public void iClickOnElementWithXpath(String xpath) {
        getDriver().findElement(By.xpath("//a[contains(text(),'Books')][1]")).click();
    }

    @Then("I click on the item that contains {string}")
    public void iClickOnTheItemThatContains(String xpath) {
        getDriver().findElement(By.xpath("//a[contains(text(),'Fahrenheit')][1]")).click();
    }

    @Then("I select the Country dropdown")
    public void thenISelectTheCountryDropdown() {
        WebElement dropdown = driver.findElement(By.id("BillingNewAddress_CountryId"));
        dropdown.click();
    }

    @And("I select United States of America from the Country dropdown")
    public void iSelectUnitedStatesOfAmericaFromTheCountryDropdown() {
        WebElement option = driver.findElement(By.xpath("//div/select/option[contains (text(), 'United States of America')]"));
        option.click();
    }
}
