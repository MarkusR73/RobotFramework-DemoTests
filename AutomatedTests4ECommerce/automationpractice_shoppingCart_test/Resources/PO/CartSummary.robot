*** Settings ***
Resource    ../CartKeywords.robot
Library     SeleniumLibrary

*** Variables ***
${SUMMARY_TEXT}                     xpath=//h1[@id='cart_title']
${DELETE_ICON_DRESS}                xpath=//a[@id='6_40_0_0']/i
${DRESS_LOCATOR}                    //tr[@id='product_6_40_0_0']
${PRODUCT_COUNT_ELEMENT}            xpath=//span[@id='summary_products_quantity']
${EXPECTED_COUNT}                   1 product
${TOTAL_PRICE}                      id=total_price
${CHECKOUT_LINK}                    xpath=//p/a[@title='Proceed to checkout']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${SUMMARY_TEXT}

Remove Dress
    Click Or Scroll     ${DELETE_ICON_DRESS}

Verify Dress Disappearance
    Wait Until Element Is Not Visible   ${DRESS_LOCATOR}
    Wait Until Expected Value Is Visible    ${EXPECTED_COUNT}   ${PRODUCT_COUNT_ELEMENT}

Price Should Be Visible
    Wait Until Element Is Visible   ${TOTAL_PRICE}

Verify Total Price
    ${total_price_value}=    Get Text    ${TOTAL_PRICE}
    Should Be Equal    ${total_price_value}    $34

Proceed Link Should Be Visible
    Wait Until Element Is Visible   ${CHECKOUT_LINK}

Click Proceed Link
    Click Element   ${CHECKOUT_LINK}