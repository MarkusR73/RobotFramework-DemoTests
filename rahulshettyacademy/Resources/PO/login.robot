*** Settings ***
Library     SeleniumLibrary
Resource    shop.robot

*** Variables ***
${LOGINPAGE_URL}            https://rahulshettyacademy.com/loginpagePractise/
${USERNAME_FIELD}           id=username
${PASSWORD_FIELD}           id=password
${ADMIN_RADIO_BUTTON}       xpath=//input[@value='admin']
${USER_RADIO_BUTTON}        xpath=//input[@value='user']
${POPUP_WINDOW}             xpath=//div[@class='modal-body']
${OKAY_BUTTON_POPUP}        xpath=//button[@id='okayBtn']
${ROLE_DROPDOWN_SELECTOR}   xpath=//select[@class='form-control']
${TEMRS_N_CONDITIONS_BOX}   id=terms
${SIGNIN_BUTTON}            id=signInBtn
${CHILD_WINDOW_LINK}        xpath=//a[@class='blinkingText']

${MAX_ATTEMPTS}             10

${VISIBLE_LOCATOR}    xpath=//div[@style='display: block;' and contains(string(.), 'Empty')]
${HIDDEN_LOCATOR}     xpath=//div[@style='display: none;' and contains(string(.), 'Empty')]

*** Keywords ***
Open page
    go to   ${LOGINPAGE_URL}

Verify load
    wait until element is visible    ${SIGNIN_BUTTON}

Fill in user information
    [Arguments]     ${username}     ${password}
    input text    ${USERNAME_FIELD}     ${username}
    input text    ${PASSWORD_FIELD}     ${password}

Choose usertype
    [Arguments]     ${type}
    IF  '${type}'=='user'
        select radio button                     radio    user
        wait until element is visible           ${POPUP_WINDOW}
        wait until element is enabled           ${OKAY_BUTTON_POPUP}
        click button                            ${OKAY_BUTTON_POPUP}
        click button                            ${OKAY_BUTTON_POPUP}
        wait until element is not visible       ${POPUP_WINDOW}
    ELSE
        select radio button                     radio    admin
    END

Choose role
    [Arguments]     ${role}
    wait until element is enabled               ${ROLE_DROPDOWN_SELECTOR}
    common.Try selecting dropdown repeatedly    ${ROLE_DROPDOWN_SELECTOR}    ${role}       ${MAX_ATTEMPTS}

Agree to terms and conditions
    wait until element is enabled       ${TEMRS_N_CONDITIONS_BOX}
    wait until keyword succeeds     5s     1s      select checkbox     ${TEMRS_N_CONDITIONS_BOX}
    checkbox should be selected         ${TEMRS_N_CONDITIONS_BOX}

Sign in
    click button    ${SIGNIN_BUTTON}

Verify success
    shop.Verify load

Verify error message visibility
    [Arguments]     ${locator}
    Wait Until Element Is Visible    ${locator}

Open child window
    click link          ${CHILD_WINDOW_LINK}
