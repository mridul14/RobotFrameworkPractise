*** Settings ***
Documentation    This is some basic info about the suite
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
User must sign in to check out
    [Documentation]    This is some basic info about the test
    [Tags]    Smoke
    open browser    https://amazon.com    chrome
    wait until page contains    Today's Deals
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    id=nav-search-submit-button
    wait until page contains    results for "Ferrari 458"
    sleep    3s
    close browser
*** Keywords ***
