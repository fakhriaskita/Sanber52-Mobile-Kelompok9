*** Settings ***
Resource         ../pageObjects/homePageObject/homePage.robot
Resource         ../pageObjects/loginPageObject/loginPage.robot
Resource         ../pageObjects/oneWayBookingObject/oneWayBooking.robot
Resource         ../pageObjects/searchFlight/searchFlight.robot
Resource         ../pageObjects/base/base.robot
Test Setup        Run Keywords
...               Open Flight Aplication 
...               AND   Login With Valid Credentials
Test Teardown     Close Flight Aplication

*** Variables ***
${VALID_EMAIL}               support@ngendigital.com
${VALID_PASSWORD}            abc123

*** Test Cases ***
User should be able to login with valid credentials
    Login With Valid Credentials
    # Open Flight Application
    # Step 2: Verify home page appears
    # Verify Home Page Appears
    # Step 3: Click sign in button on home page
    # Click Sign In Button On Home Page
    # Step 4: Verify login page appears
    # Verify Login Appears
    # Step 5: Input username
    # Input User Email On Login Page               ${VALID_EMAIL}
    # Step 6: Input password
    # Input User Password On Login Page            ${VALID_PASSWORD}
    # Step 7: Click sign in button on login page
    # Click Sign In Button On Login Page
    # Step 8: Verify user is logged in
    # Login With Valid Credentials
    Verify User Is Logged In
    # Verify Booking Flight

Doing One Way Booking Flight
    Login With Valid Credentials
    Flight Booking One Way
    Verify Booking Flight

Search Flight
    Login With Valid Credentials
    Search Flight
    Verify Search Flight

    