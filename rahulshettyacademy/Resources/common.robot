*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    PO/shop.robot
Resource    PO/login.robot

*** Variables ***
@{BROWSERS}         firefox     chrome      edge

*** Keywords ***

Begin web test
    open browser    about:blank     ${BROWSERS}[0]
    maximize browser window

Begin login test
    ${status}=  run keyword and return status   login.Verify Load
    IF  ${status}
        reload page
        login.Verify load
    ELSE
        login.Open Page
        login.Verify Load
    END

End web test
    close all browsers

Try selecting dropdown repeatedly
    [Arguments]     ${locator}      ${value}       ${limit}
    FOR    ${i}  IN RANGE    ${limit}
        ${status}=   run keyword and return status    select from list by value   ${locator}  ${value}
        exit for loop if    ${status}
        sleep    0.1s
    END

Switch to child window
    switch window    NEW

Switch to main window
    switch window    MAIN

Get products on page
    [Arguments]    ${web_element_locator}
    ${elements}=    Get WebElements     ${web_element_locator}
    @{actual_contents}=     create list
    FOR    ${element}   IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List      ${actual_contents}      ${text}
    END
    RETURN    ${actual_contents}

Verify products on page
    [Arguments]     ${expected_product_titles}  ${product_locator}
    @{actual_product_titles}=   common.Get products on page     ${product_locator}
    lists should be equal       ${actual_product_titles}        ${expected_product_titles}

Select product by name
    [Arguments]    ${product_name}      ${locator}
    ${elements}=    Get WebElements     ${locator}
    ${index}=       set variable        1
    FOR    ${element}   IN    @{elements}
        ${text}=    Get Text    ${element}
        exit for loop if    '${text}' == '${product_name}'
        ${index}=   evaluate    ${index}+1
    END
    click button    xpath=(//*[contains(@class, 'card-footer')])[${index}]/button
