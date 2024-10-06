*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${DRESSES_HEADER}                       xpath=//span[text()='Dresses']
${PRODUCT_REFERENCE_DRESS}              xpath=//p/span[text()='demo_6']
${WOMEN_HEADER}                         xpath=//h1/span[contains(text(),'Women')]
${PRODUCT_REFERENCE_BLOUSE}             xpath=//span[text()='demo_2']
${COLOR_WHITE}                          id=color_8
${ADD_TO_CART_ELEMENT}                  xpath=//p[@id='add_to_cart']/button
${SUCCESS_MESSAGE_PRODUCT_ADDED}        xpath=//h2[contains(., 'Product successfully added to your shopping cart')]
${CONTINUE_SHOPPING_LINK}               xpath=//span[@title='Continue shopping']

*** Keywords ***
Verify Load
    [Arguments]     ${element}
    Wait Until Page Contains Element    ${element}

Choose Color
    Click Element   ${COLOR_WHITE}

Verify Availability
    Wait Until Element Is Visible   ${ADD_TO_CART_ELEMENT}
    Wait Until Element Is Enabled   ${ADD_TO_CART_ELEMENT}

Add To Cart
    Click Element   ${ADD_TO_CART_ELEMENT}

Verify Successful Addition
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE_PRODUCT_ADDED}

Continue Shopping
    Click Element   ${CONTINUE_SHOPPING_LINK}