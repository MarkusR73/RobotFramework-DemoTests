*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPEN_CART_URL}        https://demo-opencart.com/index.php?route=account/login&language=en-gb
${BROWSER}              firefox
${LOGIN_URL}            ${OPEN_CART_URL}
${USERNAME}             tonttu123@gmail.com
${PASSWORD}             Toljanteri99
${INVALID_USERNAME}     invalid@example.com
${INVALID_PASSWORD}     wrongpassword
${SUCCESS_MESSAGE}      xpath=/html/body/main/div[2]/div/div/h2[1]
${LOGOUT_LINK}          xpath=/html/body/main/div[2]/div/aside/div/a[13]
${CONTINUE_LINK}        xpath=/html/body/main/div[2]/div/div/div/a
${ERROR_MESSAGE}        css=html body div#alert.toast-container.position-fixed.top-0.end-0.p-3

*** Keywords ***
Open Login Page
    Open Browser    ${OPEN_CART_URL}    ${BROWSER}
    
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    name=email    
    Input Text    name=email    ${username}
    Wait Until Element Is Visible    name=password   
    Input Text    name=password    ${password}
    Click Button    css=button.btn.btn-primary

Logout
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}
    Click Link    ${LOGOUT_LINK}
    Wait Until Element Is Visible    ${CONTINUE_LINK}
    Click Link    ${CONTINUE_LINK}
    
Verify Login Error
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
