*** Settings ***
Resource       ../base/base.robot
Resource       ../homePageObject/homePage.robot
Variables      loginPage_locators.yaml
Library    AppiumLibrary


*** Variables ***
${VALID_EMAIL}            support@ngendigital.com
${VALID_PASSWORD}         abc123

${INVALID_EMAIL}        invalid@
${INVALID_PASSWORD}     abc123 



*** Keywords ***
Verify login Appears
    Wait Until Element Is Visible        ${email_input_loginPage}
    Wait Until Element Is Visible        ${password_input_loginPage}
    Wait Until Element Is Visible        ${signIn_button_loginPage}

Input User Email On Login Page
    [Arguments]    ${email}
    Input Text     ${email_input_loginPage}      ${email}

Input User Password On Login Page
    [Arguments]    ${password}
    Input Text     ${password_input_loginPage}   ${password}

Click Sign In Button In Login Page
    Click Element  ${signIn_button_loginPage}

Login With Valid Credentials
    [Arguments]    ${email}=${VALID_EMAIL}        ${password}=${VALID_PASSWORD} 
    Verify Home Page Appears
    Click Sign In Button In Home Page
    Verify login Appears
    Input User Email On Login Page       ${email}
    Input User Password On Login Page    ${password}
    Click Sign In Button In Login Page

Login With InValid Email
    [Arguments]    ${email1}=${INVALID_EMAIL}        ${password1}=${INVALID_EMAIL} 
    Verify Home Page Appears
    Click Sign In Button In Home Page
    Verify login Appears
    Input User Email On Login Page       ${email1}
    Input User Password On Login Page    ${password1}
    Click Sign In Button In Login Page