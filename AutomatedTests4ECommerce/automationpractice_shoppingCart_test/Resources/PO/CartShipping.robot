*** Settings ***
Resource    ../Common.robot
Resource    ../CartKeywords.robot
Library    SeleniumLibrary

*** Variables ***
${AGREE_TERMS_CHECKBOX}             id=cgv
${PAY_BY_CHECK_ELEMENT}             xpath=//a[@class='cheque']
${PROCEED_TO_CHECKOUT_BUTTON}       xpath=//p/button[@type='submit']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element    ${AGREE_TERMS_CHECKBOX}

Check Terms Box
    Click Element   ${AGREE_TERMS_CHECKBOX}

Move To Payment
    Click Element   ${PROCEED_TO_CHECKOUT_BUTTON}