*** Settings ***
Documentation    This is a basic info about the whole suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Just launch Amazon home page
    [Documentation]    This is some basic info about the test
    [Tags]    Smoke
    Open Browser    https://www.amazon.com    chrome
    sleep   3s
    Close Browser
*** Keywords ***
