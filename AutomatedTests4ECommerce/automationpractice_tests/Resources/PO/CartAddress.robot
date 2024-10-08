*** Settings ***
Resource    ../Common.robot
Library    SeleniumLibrary

*** Variables ***
${CHECKBOX_DELIVERY_ADDRESS}        xpath=//div[@class='checker']/span
${PROCEED_TO_CHECKOUT_BUTTON}       xpath=//p/button[@type='submit']

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${CHECKBOX_DELIVERY_ADDRESS}

Verify Billing Address
    ${Checkbox1_value}=             Get Element Attribute       ${CHECKBOX_DELIVERY_ADDRESS}    class
    Should Be Equal As Strings      ${Checkbox1_value}          checked

Move To Shipping
    Click Element                 ${PROCEED_TO_CHECKOUT_BUTTON}