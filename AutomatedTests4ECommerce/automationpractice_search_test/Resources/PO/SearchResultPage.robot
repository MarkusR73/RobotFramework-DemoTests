*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${RESULT_COUNT_ELEMENT}             xpath=//div[@class='product-count']
${SEARCH_RESULT_LIST}               //ul[@class='product_list grid row']/li
${EXPECTED_RESULT_COUNT}            7

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${RESULT_COUNT_ELEMENT}

Verify Result Count
    ${Product_Count}=   Get Element Count   ${SEARCH_RESULT_LIST}
    Should Be True     ${Product_Count}==${EXPECTED_RESULT_COUNT}  