*** Settings ***
Resource                ../base/base.robot
Resource                ../homePageObject/homePage.robot
Variables               loginpage_locators.yaml

*** Variables ***
${VALID_EMAIL}               support@ngendigital.com
${VALID_PASSWORD}            abc123
${INVALID_EMAIL}             support123@ngendigital.com
${INVALID_PASSWORD}          abc12345
${INVALID1_EMAIL}            
${INVALID1_PASSWORD}         
${INVALID_NOTIFICATION}      Invalid username/password

*** Keywords ***
Verify Login Appears
    Wait Until Element Is Visible    ${email_input_loginPage}
    Wait Until Element Is Visible    ${password_input_loginPage}
    Wait Until Element Is Visible    ${signIn_button_loginPage}

Input User Email On Login Page
    [Arguments]   ${email}
    Input Text    ${email_input_loginPage}    ${email}

Input User Password On Login Page
    [Arguments]   ${password}
    Input Text    ${password_input_loginPage}    ${password}

Click Sign In Button On Login Page
    Click Element    ${signIn_button_loginPage}

Login With Valid Credentials
    [Arguments]    ${email}=${VALID_EMAIL}    ${password}=${VALID_PASSWORD}
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page     ${email}
    Input User Password On Login Page  ${password}
    Click Sign In Button On Login Page

# ======================================================= #
Input User Invalid Email On Login Page
     [Arguments]       ${email}=${INVALID_EMAIL}
    Input Text    ${email_input_loginPage}    ${email}

Login without Email On Login Page
     [Arguments]       ${email}=${INVALID1_EMAIL}
    Input Text    ${email_input_loginPage}    ${email}

Input User Invalid Password On Login Page
     [Arguments]       ${password}=${INVALID_PASSWORD}
    Input Text    ${password_input_loginPage}    ${password}

Login without Password On Login Page
    [Arguments]       ${password}=${INVALID1_PASSWORD}
    Input Text    ${password_input_loginPage}    ${password}

Notification Invalid Username/Password
    Wait Until Page Contains    ${INVALID_NOTIFICATION}

Login With Wrong Email
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Invalid Email On Login Page     ${INVALID_EMAIL}
    Input User Password On Login Page          ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    
Login With Wrong Password
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page                ${VALID_EMAIL}
    Input User Invalid Password On Login Page     ${INVALID_PASSWORD}
    Click Sign In Button On Login Page

Login Without input email
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page                ${INVALID1_EMAIL}
    Input User Invalid Password On Login Page     ${VALID_PASSWORD}
    Click Sign In Button On Login Page

Login Without input password
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page                ${VALID_EMAIL}
    Input User Invalid Password On Login Page     ${INVALID1_PASSWORD}
    Click Sign In Button On Login Page

Login Without input email and password
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page                ${INVALID1_EMAIL}
    Input User Invalid Password On Login Page     ${INVALID1_PASSWORD}
    Click Sign In Button On Login Page