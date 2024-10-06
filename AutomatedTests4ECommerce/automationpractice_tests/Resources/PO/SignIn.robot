*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${AUTHENTICATION_MAIN_HEADING}      xpath=//h1[text()='Authentication']
${CREATE_AN_ACCOUNT_BUTTON}         xpath=//button[@id='SubmitCreate']
${CREATE_EMAIL_FIELD}               xpath=//input[@id='email_create']
${LOGIN_EMAIL_FIELD}                id=email
${LOGIN_PASSWORD_FIELD}             id=passwd
${LOCK_ICON}                        id=SubmitLogin
${WRONG_PASSWORD}                   wrong
${INVALID_PASSWORD_ERROR}           xpath=//p[text()='There is 1 error']

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element   ${AUTHENTICATION_MAIN_HEADING}

Begin Account Creation
    Input Email Address
    Click Create Account Button

Input Email Address
    Input Text  ${CREATE_EMAIL_FIELD}   ${USER_INFORMATION.EMAIL}

Click Create Account Button
    Click Button   ${CREATE_AN_ACCOUNT_BUTTON}

Try To Sign In
    [Arguments]     ${email}    ${password}
    Input Text      ${LOGIN_EMAIL_FIELD}        ${email}
    Input Text      ${LOGIN_PASSWORD_FIELD}     ${password}
    Click Element   ${LOCK_ICON}

Verify Error Message
    Wait Until Element Is Visible   ${INVALID_PASSWORD_ERROR}
