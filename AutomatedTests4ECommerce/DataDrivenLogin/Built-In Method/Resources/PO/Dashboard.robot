*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${DASHBOARD_TEXT_LOCATOR}       xpath=//h6[text()='Dashboard']

*** Keywords ***
Verify page loaded
    wait until element is visible    ${DASHBOARD_TEXT_LOCATOR}