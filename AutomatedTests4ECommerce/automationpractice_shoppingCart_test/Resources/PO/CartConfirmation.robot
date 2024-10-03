*** Settings ***
Resource    ../CartKeywords.robot
Library    SeleniumLibrary

*** Variables ***
${CONFIRM_MY_ORDER_BUTTON}          xpath=//p/button[@type='submit']
${ORDER_COMPLETE_MESSAGE}           xpath=//p[@class='alert alert-success']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element    ${CONFIRM_MY_ORDER_BUTTON}

Confirm Order
    Click Element   ${CONFIRM_MY_ORDER_BUTTON}

Verify Confirmation Success
    Wait Until Page Contains Element    ${ORDER_COMPLETE_MESSAGE}
    Element Text Should Be      ${ORDER_COMPLETE_MESSAGE}       Your order on My Shop is complete.
