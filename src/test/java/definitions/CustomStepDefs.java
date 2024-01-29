package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.*;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class CustomStepDefs {
    @Given("client open web page")
    public void clientOpenWebPage() throws InterruptedException {
        getDriver().navigate().to("https://google.com");
        Thread.sleep(2000);
        WebElement searchBar = getDriver().findElement(By.xpath("//textarea[@name='q']"));
        searchBar.sendKeys("Portnov");
        searchBar.sendKeys(Keys.RETURN);
        Thread.sleep(1000);
        getDriver().navigate().back();
        Thread.sleep(1000);
        getDriver().navigate().forward();
        Thread.sleep(1000);
        getDriver().navigate().refresh();
        Thread.sleep(1000);
    }

    @Given("client open portnov web page")
    public void clientOpenPortnovWebPage() {
        getDriver().get("https://portnov.com");
    }

    @Then("client set browser size to mobile")
    public void clientSetBrowserSizeToMobile() throws Exception {
        getDriver().manage().window().setSize(new Dimension(900, 600));
        Thread.sleep(1000);
        WebElement headerBar = getDriver().findElement(By.xpath("//div[@id='header-bar-desktop']"));
        Thread.sleep(1000);
        boolean headerBarDisplayed = headerBar.isDisplayed();
        assertThat(headerBarDisplayed).isFalse();
    }

    @Given("client open test url for the form")
    public void clientOpenTestUrlForTheForm() {
        getDriver().get("https://testautomationpractice.blogspot.com/2018/09/automation-form.html");
    }

    @And("I type {string} into all input fields")
    public void iTypeIntoAllInputFields(String inputString) {
        List<WebElement> webElementList = getDriver().findElements(By.xpath("//input[@type='text']"));
        for (WebElement we : webElementList) {
            we.sendKeys(inputString);
        }
    }

    @Then("I search for the element")
    public void iSearchForTheElement() {
        WebElement we = getDriver().findElement(By.id("name"));
        WebElement we2 = getDriver().findElement(By.cssSelector("#name"));
        WebElement iframe = getDriver().findElement(By.tagName("iframe"));

    }

    @Then("I search for new elements")
    public void iSearchForNewElements() {
        WebElement we = getDriver().findElement(By.id("username"));
    }

    @Then("I search again for new elements")
    public void iSearchAgainForNewElements() {
        WebElement userName = getDriver().findElement(By.name("username"));
    }

//    @Then("I type {string} into username")
//    public void iTypeIntoUsername(String userNameTxt) {
//        WebElement userName = getDriver().findElement(By.name) userName.sendKeys("Clyde Graham");
//
//    }
}