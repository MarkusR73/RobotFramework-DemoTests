*** Settings ***
Library     SeleniumLibrary
Resource    ../common.robot

*** Variables ***
${TOTAL_TEXT}               xpath=//h3[text()='Total']
${CART_PRODUCT_LOCATOR}     xpath=//div/h4[@class='media-heading']//a

*** Keywords ***
Verify load
    wait until element is visible    ${TOTAL_TEXT}

Check products
    [Arguments]     ${expected_product_titles}
    common.Verify products on page    ${expected_product_titles}    ${CART_PRODUCT_LOCATOR}
