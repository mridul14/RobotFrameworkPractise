*** Settings ***
Documentation    General Suite
Library    SeleniumLibrary
Test Setup    open browser    ${appURL}    ${browser}
Test Teardown    close browser

*** Variables ***
#SCALAR VARIABLES
${appURL}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome

#LIST VARIABLES
@{credentials}    Admin    admin123

#DICTIONARY VARIABLES
#&{DICTIONARY}     string=cat    int=${1}    list=@{LIST}
#Usage
#${DICTIONARY}    # {'string': 'cat', 'int': 1, 'list': ['one', 'two', 'three']}
#${DICTIONARY}[string]    # cat
#${DICTIONARY.int}    # 1
#${DICTIONARY}[list][0]    # one

*** Test Cases ***
Login General
    [Documentation]    Login to OpenHRMLive
    [Tags]    Smoke
    log to console    ${credentials}[1]
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
    input text    id=txtUsername    ${credentials}[0]
Enter Password
    input password    id=txtPassword    ${credentials}[1]
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
