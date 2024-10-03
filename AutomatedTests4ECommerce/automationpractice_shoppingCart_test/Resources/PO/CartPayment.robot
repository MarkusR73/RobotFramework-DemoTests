*** Settings ***
Resource    /CartSummary.robot
Resource    ../Common.robot
Resource    ../CartKeywords.robot
Library    SeleniumLibrary

*** Variables ***
${PAY_BY_CHECK_ELEMENT}             xpath=//p/a[@title='Pay by check.']

*** Keywords ***
Verify Load
    Element Should Be Visible       ${PAY_BY_CHECK_ELEMENT}

Validate Total Price
    ${total_price}=                         Get Text            ${TOTAL_PRICE}
    Run Keyword And Continue On Failure     Should Be Equal     ${total_price}    $34

Log The Result
    Log    Total price is: ${total_price}

Choose Payment Method
    Click Element    ${PAY_BY_CHECK_ELEMENT}