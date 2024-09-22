*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Product_Reference}                xpath=//span[text()='demo_6']
${COLOR_WHITE}                      id=color_8
${ADD_TO_CART_ELEMENT}              xpath=//p[@id='add_to_cart']/button

*** Keywords ***
Verify Load
    Wait Until Page Contains Element    ${Product_Reference}

Choose Dress Color
    Click Element   ${COLOR_WHITE}

Verify Availability
    Wait Until Element Is Visible   ${ADD_TO_CART_ELEMENT}
    Wait Until Element Is Enabled   ${ADD_TO_CART_ELEMENT}

Add To Cart
    Click Element   ${ADD_TO_CART_ELEMENT}