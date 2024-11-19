*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${LOGIN_URL}                        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${LOGIN_PAGE_HEADER}                xpath=//h5[text()='Login']

${LOGIN_USERNAME_FIELD}             xpath=//input[@name="username"]
${LOGIN_PASSWORD_FIELD}             xpath=//input[@name="password"]
${LOGIN_BUTTON}                     xpath=//button[@type='submit']

*** Keywords ***
Navigate to
    open browser    ${LOGIN_URL}        ${BROWSER}
    wait until page contains element    ${LOGIN_PAGE_HEADER}

Attempt login with current credentials
    [Arguments]     ${credentials}
    Fill in user credentials    ${credentials[0]}     ${credentials[1]}
    Click "Login" button

Fill in user credentials
    [Arguments]     ${username}     ${password}
    input text      ${LOGIN_USERNAME_FIELD}     ${username}
    input text      ${LOGIN_PASSWORD_FIELD}     ${password}

Click "Login" button
    click button    ${LOGIN_BUTTON}


Verify login success
    [Arguments]     ${credentials}
    Verify expected message appears     ${credentials[2]}      ${credentials[3]}

Verify expected message appears
    [Arguments]     ${locator}      ${expected_message}
    wait until page contains element    ${locator}
    ${message}=     get text            ${locator}
    should be equal as strings          ${message}      ${expected_message}