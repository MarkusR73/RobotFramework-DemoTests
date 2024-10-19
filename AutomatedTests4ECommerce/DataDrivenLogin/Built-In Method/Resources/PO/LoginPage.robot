*** Settings ***
Library     SeleniumLibrary
Resource    Dashboard.robot
Resource    ../Common.robot

*** Variables ***
${LOGIN_URL}                        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${LOGIN_PAGE_HEADER}                xpath=//h5[text()='Login']

${LOGIN_USERNAME_FIELD}             xpath=//input[@name="username"]
#${LOGIN_USERNAME_FIELD}             xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input
${LOGIN_PASSWORD_FIELD}             xpath=//input[@name="password"]
${LOGIN_BUTTON}                     xpath=//button[@type='submit']

${DASHBOARD_TEXT_LOCATOR}           xpath=//h6[text()='Dashboard']

${ERROR_MESSAGE_LOCATOR}            xpath=//div[1]/p[text()='Invalid credentials']
${EMAIL_REQUIRED_ALERT_LOCATOR}     xpath=//div[1]/div/span[text()='Required']

*** Keywords ***
Navigate to
    open browser    ${LOGIN_URL}        ${BROWSER}
    wait until page contains element    ${LOGIN_PAGE_HEADER}

Attempt login with current credentials
    [Arguments]     ${credentials}
    Fill in user credentials    ${credentials.USERNAME}     ${credentials.PASSWORD}
    Click "Login" button

Fill in user credentials
    [Arguments]     ${username}     ${password}
    input text      ${LOGIN_USERNAME_FIELD}     ${username}
    input text      ${LOGIN_PASSWORD_FIELD}     ${password}

Click "Login" button
    click button    ${LOGIN_BUTTON}


Verify login success
    [Arguments]     ${credentials}
    Verify expected message appears     ${credentials.MESSAGE_LOCATOR}      ${credentials.MESSAGE}

Verify expected message appears
    [Arguments]     ${locator}      ${expected_message}
    wait until element is visible   ${locator}
    ${message}=     get text        ${locator}
    should be equal as strings      ${message}      ${expected_message}