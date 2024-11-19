*** Settings ***
Resource    CartSummary.robot
Resource    ../Common.robot
Library    SeleniumLibrary

*** Variables ***
${PAY_BY_CHECK_LINK}                xpath=//p/a[@title='Pay by check.']
${EXPECTED_TOTAL_PRICE}             $34
${TOTAL_PRICE_LOCATOR}              id=total_price

*** Keywords ***
Verify Page Loaded
    Element Should Be Visible       ${PAY_BY_CHECK_LINK}

Compare Locator Value To Expected Value
    [Arguments]     ${locator}      ${expected_value}
    ${total_price}=     Get Text            ${TOTAL_PRICE_LOCATOR}
    Run Keyword And Continue On Failure     Should Be Equal    ${total_price}    ${EXPECTED_TOTAL_PRICE}

Choose Payment Method
    [Arguments]     ${payment_method}
    Click Element    ${PAY_BY_CHECK_LINK}