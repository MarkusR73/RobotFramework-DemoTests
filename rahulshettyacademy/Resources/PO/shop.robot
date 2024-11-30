*** Settings ***
Library     SeleniumLibrary
Resource    ../common.robot

*** Variables ***
${HOME_PAGE_URL}            https://rahulshettyacademy.com/angularpractice/shop
${NAVBAR_HEADER_LOCATOR}    xpath=//a[text()='ProtoCommerce Home']
${SHOP_PRODUCT_LOCATOR}     xpath=//h4[contains(@class, 'card-title')]//a
${CHECKOUT_BUTTON}          xpath=//a[contains(string(.), 'Checkout')]

*** Keywords ***

Open page
    go to   ${HOME_PAGE_URL}

Verify load
    wait until element is visible    ${NAVBAR_HEADER_LOCATOR}

Verify products on page
    [Arguments]    ${product_titles}
    common.Verify products on page    ${product_titles}     ${SHOP_PRODUCT_LOCATOR}

Add selected products to cart
    [Arguments]     ${titles}
    FOR     ${title}     IN      @{titles}
        common.Select product by name    ${title}      ${SHOP_PRODUCT_LOCATOR}
    END

Move to cart
    wait until element is visible   ${CHECKOUT_BUTTON}
    click element                   ${CHECKOUT_BUTTON}