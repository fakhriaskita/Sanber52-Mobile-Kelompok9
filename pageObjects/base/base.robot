# Action yang berbau general disimpan di base 
*** Settings ***
# untuk memanggil keywords yang ada di appium libary
Library    AppiumLibrary 

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     11.0
${DEVICE_NAME}          RR8M403V2TZ
${APP_PACKAGE}          com.example.myapplication
${APP_ACTIVITY}         com.example.myapplication.MainActivity


*** Keywords ***
# membuka aplikasi
Open Flight Aplication
    Open Application    remote_url=${REMOTE_URL}
    ...                 platformName=${PLATFORM_NAME}
    ...                 platformVersion=${PLATFORM_VERSION}
    ...                 deviceName=${DEVICE_NAME}
    ...                 appPackege=${APP_PACKAGE}
    ...                 appActivity=${APP_ACTIVITY}

# menutup aplikasi
Close Flight Aplication
    Close Application