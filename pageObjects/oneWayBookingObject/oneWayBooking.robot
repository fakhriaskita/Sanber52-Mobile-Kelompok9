*** Settings ***
Resource                ../base/base.robot
Resource                ../homePageObject/homePage.robot
Resource                ../loginPageObject/loginPage.robot
Variables               oneWayBooking_locators.yaml

*** Variables ***
${value_fromcity}        Chicago
${value_tocity}          Paris
${value_class}           First

*** Keywords ***
Go to Booking Page
    Wait Until Element Is Visible    ${userName_text_homePage}
    Click Element    ${button_bookflight}

Verify Booking Appears
    Wait Until Element Is Visible    ${button_dropdown_fromcity}
    Wait Until Element Is Visible    ${button_dropdown_tocity}

Select From City
    [Arguments]    ${button_dropdown_fromcity}    ${value_fromcity}
    Click Element    ${button_dropdown_fromcity}
    Wait Until Element Is Visible    xpath=//*[@text='${value_fromcity}']
    Click Element    xpath=//*[@text='${value_fromcity}']

Select To City
    [Arguments]    ${button_dropdown_tocity}    ${value_tocity}
    Click Element    ${button_dropdown_tocity}
    Wait Until Element Is Visible    xpath=//*[@text='${value_tocity}']
    Click Element    xpath=//*[@text='${value_tocity}']

Select Class
    [Arguments]    ${button_dropdown_class}    ${value_class}
    Click Element    ${button_dropdown_class}
    Wait Until Element Is Visible    xpath=//*[@text='${value_class}']
    Click Element    xpath=//*[@text='${value_class}']

Select Start Date
    Click Element        ${button_startdate}
    Wait Until Element Is Visible    xpath=${selectdate_startdate}
    Click Element        xpath=${selectdate_startdate}
    Click Element        ${submitbutton_startdate}

Choose Option Flight
    Click Element        ${radiobutton_flight}

Click Booking
    Click Element        ${buttonsubmit_bookflight}

Verify Confirm Booking Order Appears
    Wait Until Element Is Visible        ${select_price}

Select Price
    Click Element        ${select_price}

Submit Confirm Booking Order
    Click Element        ${button_confirm_order}

#----------------------------------------------------------

Flight Booking One Way   
    Go to Booking Page
    Verify Booking Appears
    Select From City    ${button_dropdown_fromcity}    ${value_fromcity}
    Select To City    ${button_dropdown_tocity}        ${value_tocity}
    Select Class    ${button_dropdown_class}           ${value_class}
    Select Start Date
    Choose Option Flight
    Click Booking
    Verify Confirm Booking Order Appears
    Select Price
    Submit Confirm Booking Order
