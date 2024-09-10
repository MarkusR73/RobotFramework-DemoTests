*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${OPEN_CART_URL}    https://demo-opencart.com/index.php?route=account/login&language=en-gb
${USERNAME}         tonttu123@gmail.com
${PASSWORD}         Toljanteri99
${BROWSER}          firefox

*** Test Cases ***
Valid User Can Login
    Open Browser    ${OPEN_CART_URL}    ${BROWSER}
    Wait Until Element Is Visible    name=email    
    Input Text    name=email    ${USERNAME}
    Wait Until Element Is Visible    name=password   
    Input Text    name=password    ${PASSWORD}
    Click Button    css=button.btn.btn-primary
    # Wait until 'My Account' is visible on the page
    Wait Until Element Is Visible    xpath=/html/body/main/div[2]/div/div/h2[1]
    # Click 'Logout' link 
    Click Link    xpath=/html/body/main/div[2]/div/aside/div/a[13]
    # Wait until logout is executed and then click 'Continue'
    Wait until Element Is Visible   xpath=/html/body/main/div[2]/div/div/div/a
    Click Link    xpath=/html/body/main/div[2]/div/div/div/a
    Close Browser
    
Invalid User Cannot Login
    Open Browser    ${OPEN_CART_URL}    ${BROWSER}
    Wait Until Element Is Visible    name=email
    Input Text    name=email    invalid@example.com
    Wait Until Element Is Visible    name=password
    Input Text    name=password    wrongpassword
    Click Button    css=button.btn.btn-primary
    # Check if the error message pops up
    Wait Until Element Is Visible    css=html body div#alert.toast-container.position-fixed.top-0.end-0.p-3
    Close Browser