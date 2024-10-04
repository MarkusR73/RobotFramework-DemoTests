*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCESS_MESSAGE_REGISTRATION}     xpath=//p[contains(text(),'Your account has been created.')]
${SIGN_OUT_LINK}                    xpath=//a[@class='logout']
${MY_ACCOUNT_HEADER}                xpath=//h1[text()='My account']
${HOME_ICON}                        xpath=//a[@title='Return to Home']

*** Keywords ***
Verify Registration
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE_REGISTRATION}

Verify Sign In
    Wait Until Page Contains Element    ${MY_ACCOUNT_HEADER}

Sign Out
    Click Element   ${SIGN_OUT_LINK}

Move To Home Page
    Click Element   ${HOME_ICON}