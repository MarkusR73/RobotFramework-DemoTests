*** Settings ***
Resource    ../CartResources.robot
Library     SeleniumLibrary

*** Variables ***
${SUCCESS_MESSAGE_REGISTRATION}     xpath=//p[contains(text(),'Your account has been created.')]
${SIGN_OUT_LINK}                    xpath=//a[@class='logout']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE_REGISTRATION}

Sign Out
    Click Element   ${SIGN_OUT_LINK}