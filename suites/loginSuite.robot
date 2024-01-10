*** Settings ***
Resource         ../pageObjects/homePageObject/homePage.robot
Resource         ../pageObjects/loginPageObject/loginPage.robot
Resource         ../pageObjects/oneWayBookingObject/oneWayBooking.robot
Resource         ../pageObjects/searchFlight/searchFlight.robot
Test Setup       Run Keywords    
...              Open Flight Application 
Test Teardown    Close Flight Application

*** Variables ***
${VALID_EMAIL}               support@ngendigital.com
${VALID_PASSWORD}            abc123

*** Test Cases ***
User should be able to login with valid credentials
    Login With Valid Credentials
    Verify User Is Logged In

Doing One Way Booking Flight
    Login With Valid Credentials
    Flight Booking One Way
    Verify Booking Flight

Search Flight
    Login With Valid Credentials
    Search Flight
    Verify Search Flight

User should not be able to login with wrong email
    Login With Wrong Email
    Notification Invalid Username/Password

User should not be able to login with wrong password
    Login With Wrong Password
    Notification Invalid Username/Password

User should not be able to login without input email
    Login Without input email
    Notification Invalid Username/Password

User should not be able to login without input password
    Login Without input password
    Notification Invalid Username/Password

User should not be able to login without input email and password
    Login Without input email and password
    Notification Invalid Username/Password