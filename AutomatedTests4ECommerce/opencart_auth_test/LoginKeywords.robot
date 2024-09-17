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