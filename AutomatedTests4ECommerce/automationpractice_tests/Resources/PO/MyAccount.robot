*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ACCOUNT_CREATION_SUCCESS_MESSAGE}     xpath=//p[contains(text(),'Your account has been created.')]
${SIGN_OUT_LINK}                        xpath=//a[@class='logout']
${MY_ACCOUNT_HEADER}                    xpath=//h1[text()='My account']


*** Keywords ***
Success Message Should Be Visible
    Wait Until Page Contains Element    ${ACCOUNT_CREATION_SUCCESS_MESSAGE}

Verify Sign In
    Wait Until Page Contains Element    ${MY_ACCOUNT_HEADER}

Sign Out
    Click Element   ${SIGN_OUT_LINK}

