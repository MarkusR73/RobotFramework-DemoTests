*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${RESULT_COUNT_ELEMENT}             xpath=//div[@class='product-count']
${SEARCH_RESULT_LIST}               //ul[@class='product_list grid row']/li
${EXPECTED_RESULT_COUNT}            7

${CHOSEN_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']
${CHOSEN_BLOUSE}                    xpath=//a[@class='product-name' and @title='Blouse']
${PRODUCT_REFERENCE_BLOUSE}         xpath=//span[text()='demo_2']
${PRODUCT_REFERENCE_DRESS}          xpath=//p/span[text()='demo_6']

*** Keywords ***
Verify Load
    [Arguments]     ${element}
    Wait Until Page Contains Element   ${element}

Choose Product
    [Arguments]     ${product}
    Common.Click Or Scroll      ${product}

Verify Search Listing Load
    Wait Until Page Contains Element   ${RESULT_COUNT_ELEMENT}

Verify Result Count
    ${Product_Count}=   Get Element Count   ${SEARCH_RESULT_LIST}
    Should Be True     ${Product_Count}==${EXPECTED_RESULT_COUNT}