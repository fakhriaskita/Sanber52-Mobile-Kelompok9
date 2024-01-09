*** Settings ***
Resource                ../base/base.robot
Resource                ../homePageObject/homePage.robot
Resource                ../loginPageObject/loginPage.robot
Variables               searchFlight_locators.yaml

*** Variables ***
${value_flightnumber}        DA935

*** Keywords ***
Go to Page Flight Search
    Wait Until Element Is Visible    xpath=${button_homepageSearch}
    Click Element    xpath=${button_homepageSearch}

Enter Flight Number
    Wait Until Element Is Visible    ${field_flightnumber}
    Input Text    ${field_flightnumber}    ${value_flightnumber}

Click Button Search
    Click Element    ${button_searchFlight}


Search Flight
    Go to Page Flight Search
    Enter Flight Number
    Click Button Search

