*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${CONTINUE_LINK}                xpath=//div/a[contains(text(),'Continue')]

*** Keywords ***
VerifyLogout
    Wait Until Page Contains Element    ${CONTINUE_LINK}
    Click Link    ${CONTINUE_LINK}