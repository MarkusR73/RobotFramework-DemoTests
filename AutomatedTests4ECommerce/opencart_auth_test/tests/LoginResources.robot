*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPEN_CART_URL}        https://demo-opencart.com/index.php?route=account/login&language=en-gb
${BROWSER}              firefox

${LOGIN_URL}            ${OPEN_CART_URL}
${USERNAME}             tonttu123@gmail.com
${PASSWORD}             Toljanteri99
${EMAIL_FIELD}          id=input-email
${PASSWORD_FIELD}       id=input-password
${LOGIN_BUTTON}         xpath=//button[@type='submit']

${INVALID_USERNAME}     invalid@example.com
${INVALID_PASSWORD}     wrongpassword
${LOGOUT_LINK}          xpath=//div/a[contains(text(),'Logout')]
${CONTINUE_LINK}        xpath=//div/a[contains(text(),'Continue')]
${ERROR_MESSAGE}        xpath=//div[@id='alert']/dirv

*** Keywords ***
Open Login Page
    Open Browser    ${OPEN_CART_URL}    ${BROWSER}
    
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element     ${EMAIL_FIELD}    
    Input Text    ${EMAIL_FIELD}    ${username}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}   
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Logout
    Wait Until Page Contains Element    ${LOGOUT_LINK}
    Click Link    ${LOGOUT_LINK}
    Wait Until Page Contains Element    ${CONTINUE_LINK}
    Click Link    ${CONTINUE_LINK}
    
Verify Login Error
    Wait Until Page Contains Element    ${ERROR_MESSAGE}
