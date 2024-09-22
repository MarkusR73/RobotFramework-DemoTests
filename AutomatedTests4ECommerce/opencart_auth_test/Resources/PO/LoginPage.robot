*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Login_Page}                   https://demo-opencart.com/index.php?route=account/login&language=en-gb
${Login_Header}                 xpath=//h2[text()='Returning Customer']
&{USER_INFORMATION}             USERNAME=tonttu123@gmail.com    PASSWORD=Toljanteri99
&{INVALID_USER_INFORMATION}     USERNAME=invalid@example.com    PASSWORD=wrongpassword

${EMAIL_FIELD}                  id=input-email
${PASSWORD_FIELD}               id=input-password
${LOGIN_BUTTON}                 xpath=//button[@type='submit']

${ERROR_MESSAGE}                xpath=//div[@id='alert']/dirv

*** Keywords ***
Load
    Go To    ${Login_Page}

Verify Page Loaded
    wait until element is visible       ${Login_Header}

Login
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text      ${EMAIL_FIELD}      ${username}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}
    Input Text      ${PASSWORD_FIELD}   ${password}
    Click Button    ${LOGIN_BUTTON}

Verify Login Error
    Wait Until Page Contains Element    ${ERROR_MESSAGE}