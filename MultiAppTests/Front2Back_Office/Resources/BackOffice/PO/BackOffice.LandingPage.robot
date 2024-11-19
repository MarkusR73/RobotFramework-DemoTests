*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Data/InputData.robot

*** Variables ***
${BACKOFFICE_DASHBOARD_HEADER}    xpath=//h1[text()='Dashboard']

*** Keywords ***
Navigate to
    go to    ${URLS.BACKOFFICE}

Verify page loaded
    wait until page contains element    ${BACKOFFICE_DASHBOARD_HEADER}