*** Settings ***
Documentation    General Suite
Library    SeleniumLibrary
Test Setup    open browser    ${appURL}    ${browser}
Test Teardown    close browser

*** Variables ***
${appURL}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome

*** Test Cases ***
Login General
    [Documentation]    Login to OpenHRMLive
    [Tags]    Smoke
    Maximize Window
    Enter Username
    Enter Password
    Click On Login Button
    sleep    3s
    Verify Dashboard For User
    Logout From Application

*** Keywords ***
Maximize Window
    maximize browser window
Enter Username
    input text    id=txtUsername    Admin
Enter Password
    input password    id=txtPassword    admin123
Click On Login Button
    click button    id=btnLogin
Verify Dashboard For User
    ${url}    get location
    log to console    ${url}
    should contain    ${url}    dashboard
Logout From Application
    click link    partial link:Welcome
    sleep    3s
    click link    link:Logout