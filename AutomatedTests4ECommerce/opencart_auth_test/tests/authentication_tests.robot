*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPEN_CART_URL}    https://demo.opencart.com/en-gb?route=account/login
${USERNAME}         tonttu123@gmail.com
${PASSWORD}         Toljanteri99

*** Test Cases ***
Valid User Can Login
    Open Browser    ${OPEN_CART_URL}    firefox
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    ${USERNAME}
    Wait Until Element Is Visible    name=password    10s
    Input Text    name=password    ${PASSWORD}
    # Use the correct selector for the login button
    Click Button    css=button.btn.btn-primary
    Wait Until Element Is Visible    xpath=/html/body/main/div[2]/div/aside/div/a[13]
    Close Browser
