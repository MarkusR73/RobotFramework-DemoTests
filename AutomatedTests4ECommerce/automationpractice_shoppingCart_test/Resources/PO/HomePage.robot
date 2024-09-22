*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]

*** Keywords ***
Open Page
    Go To   ${URL}

Verify Load
    Wait Until Page Contains Element   ${SIGN_IN_LINK}

Click Sign In Link
    Click Element   ${SIGN_IN_LINK}