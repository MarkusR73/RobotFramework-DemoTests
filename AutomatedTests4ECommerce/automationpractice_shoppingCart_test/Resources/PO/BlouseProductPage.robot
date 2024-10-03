*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${PRODUCT_REFERENCE_BLOUSE}             xpath=//span[text()='demo_2']
${COLOR_WHITE}                          id=color_8
${ADD_TO_CART_ELEMENT}                  xpath=//p[@id='add_to_cart']/button

*** Keywords ***
Verify Load
    Wait Until Page Contains Element    ${PRODUCT_REFERENCE_BLOUSE}

Choose Color
    Click Element   ${COLOR_WHITE}

Verify Availability
    Wait Until Element Is Visible   ${ADD_TO_CART_ELEMENT}
    Wait Until Element Is Enabled   ${ADD_TO_CART_ELEMENT}

Add To Cart
    Click Element   ${ADD_TO_CART_ELEMENT}