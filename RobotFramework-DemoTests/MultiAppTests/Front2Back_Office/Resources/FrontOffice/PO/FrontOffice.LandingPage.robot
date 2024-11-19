*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Data/InputData.robot

*** Variables ***
${FRONTOFFICE_WELCOME_TEXT}    Welcome To Our Studio!

*** Keywords ***
Navigate to
    go to    ${URLS.FRONTOFFICE}

Verify page loaded
    wait until page contains    ${FRONTOFFICE_WELCOME_TEXT}