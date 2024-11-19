*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary
Library     SeleniumLibrary

*** Variables ***
${SUMMARY_TEXT}                     xpath=//h1[@id='cart_title']
${DELETE_ICON_DRESS}                xpath=//a[@id='6_40_0_0']/i
${DRESS_LOCATOR}                    //tr[@id='product_6_40_0_0']
${PRODUCT_COUNT_ELEMENT}            xpath=//span[@id='summary_products_quantity']
${PRODUCT_COUNT}                    0
${CART_EMPTY_MESSAGE}               xpath=//p[text()='Your shopping cart is empty.']
${EXPECTED_COUNT}                   1 product
${CHECKOUT_LINK}                    xpath=//p/a[@title='Proceed to checkout']

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element   ${SUMMARY_TEXT}

Check Product Count
    ${text} =        Get Text    ${PRODUCT_COUNT_ELEMENT}
    ${product_count} =    Evaluate    int(re.search(r'\\d+', '''${text}''').group(0))    modules=re
    Set Global Variable    ${PRODUCT_COUNT}     ${product_count}

Remove Product
    [Arguments]     ${delete_icon}
    Check Product Count
    Click Element   ${delete_icon}
    IF      ${PRODUCT_COUNT}==1
        Wait Until Element Is Visible       ${CART_EMPTY_MESSAGE}
    ELSE
        Product Count Should Be Updated
    END

Product Count Should Be Updated
    ${expected_count} =             Evaluate        ${PRODUCT_COUNT} - 1
    FOR  ${index}  IN RANGE  0  10
        Check Product Count
        Run Keyword If  ${PRODUCT_COUNT} == ${expected_count}  Exit For Loop
        Sleep  1s
    END
    Should Be Equal As Integers    ${PRODUCT_COUNT}     ${expected_count}      #Expected value '${expected_count}' not found.

Click "Proceed to checkout" Link
    Wait Until Element Is Visible   ${CHECKOUT_LINK}
    Click Element                   ${CHECKOUT_LINK}