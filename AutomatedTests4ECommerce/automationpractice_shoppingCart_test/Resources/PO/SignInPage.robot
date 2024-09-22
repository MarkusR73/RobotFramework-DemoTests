*** Settings ***
Resource    ../CartResources.robot
Library     SeleniumLibrary

*** Variables ***
${CREATE_AN_ACCOUNT_BUTTON}         xpath=//button[@id='SubmitCreate']
${CREATE_EMAIL_FIELD}               xpath=//input[@id='email_create']

${LOGIN_EMAIL_FIELD}                id=email
${LOGIN_PASSWORD_FIELD}             id=passwd
${LOCK_ICON}                        id=SubmitLogin

${INVALID_PASSWORD_ERROR}           xpath=//p[text()='There is 1 error']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

Input Email Address
    Input Text  ${CREATE_EMAIL_FIELD}   ${USER_INFORMATION.EMAIL}

Click Create Account Button
    Click Button   ${CREATE_AN_ACCOUNT_BUTTON}

Fill Valid User Info
    Input Text  ${LOGIN_EMAIL_FIELD}        ${USER_INFORMATION.EMAIL}
    Input Text  ${LOGIN_PASSWORD_FIELD}     ${USER_INFORMATION.PASSWORD}

Fill Invalid User Info
    Input Text  ${LOGIN_EMAIL_FIELD}        ${USER_INFORMATION.EMAIL}
    Input Text  ${LOGIN_PASSWORD_FIELD}     ${WRONG_PASSWORD}

Sign In
    Click Element   ${LOCK_ICON}

Verify Error Message
    Wait Until Element Is Visible   ${INVALID_PASSWORD_ERROR}
