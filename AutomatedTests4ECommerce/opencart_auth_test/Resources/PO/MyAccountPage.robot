*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGOUT_LINK}                  xpath=//div/a[contains(text(),'Logout')]

*** Keywords ***
Logout
    Wait Until Page Contains Element    ${LOGOUT_LINK}
    Click Link    ${LOGOUT_LINK}
