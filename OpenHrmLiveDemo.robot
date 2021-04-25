*** Settings ***
Documentation    General Suite
Library    SeleniumLibrary
Test Setup    open browser    ${appURL}    ${browser}
Test Teardown    close browser

*** Variables ***
${appURL}    https://opensource-demo.orangehrmlive.com/
#${browser}    headlesschrome
${browser}    chrome

*** Test Cases ***
Login General
    [Documentation]    Login to OpenHRMLive
    [Tags]    Smoke
    maximize browser window
    input text    id=txtUsername    Admin
    input password    id=txtPassword    admin123
    click button    id=btnLogin
    sleep    3s
    ${url}    get location
    log to console    ${url}
    should contain    ${url}    dashboard
*** Keywords ***
