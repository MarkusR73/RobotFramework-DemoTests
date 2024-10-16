*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${REFERENCE_SUMMER_DRESS}               xpath=//p/span[text()='demo_6']
${WOMEN_HEADER}                         xpath=//h1/span[contains(text(),'Women')]
${PRODUCT_REFERENCE_BLOUSE}             xpath=//span[text()='demo_2']
${COLOR_BOX_WHITE}                      id=color_8
${ADD_TO_CART_BUTTON}                   xpath=//p[@id='add_to_cart']/button
${PRODUCT_SUCCERSFULLY ADDED}           xpath=//h2[contains(., 'Product successfully added to your shopping cart')]
${CONTINUE_SHOPPING_LINK}               xpath=//span[@title='Continue shopping']

*** Keywords ***
Verify Page Loaded
    [Arguments]     ${element}
    Wait Until Page Contains Element    ${element}

Choose Color
    [Arguments]     ${color_element}
    Click Element   ${color_element}

Verify Availability
    Wait Until Element Is Visible   ${ADD_TO_CART_BUTTON}
    Wait Until Element Is Enabled   ${ADD_TO_CART_BUTTON}

Click "Add to cart" Button
    Click Element   ${ADD_TO_CART_BUTTON}

Window With Success Message should Appear
    Wait Until Element Is Visible   ${PRODUCT_SUCCERSFULLY ADDED}

Click "Continue Shopping" Element
    Click Element                       ${CONTINUE_SHOPPING_LINK}
    Wait Until Element Is Not Visible   ${CONTINUE_SHOPPING_LINK}