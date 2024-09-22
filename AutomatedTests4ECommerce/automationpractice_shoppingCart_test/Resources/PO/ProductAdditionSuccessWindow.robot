*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCESS_MESSAGE_PRODUCT_ADDED}    xpath=//h2[contains(., 'Product successfully added to your shopping cart')]
${CONTINUE_SHOPPING_LINK}           xpath=//span[@title='Continue shopping']

*** Keywords ***
Verify Appearance
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE_PRODUCT_ADDED}

Continue Shopping
    Click Element   ${CONTINUE_SHOPPING_LINK}