*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${RESULT_COUNT_ELEMENT}             xpath=//div[@class='product-count']
${SEARCH_RESULT_LIST}               //ul[@class='product_list grid row']/li
${EXPECTED_RESULT_COUNT}            7

${DRESSES_HEADER}                   xpath=//span[text()='Dresses']
${SUMMER_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']
${DRESS_PRODUCT_REFERENCE}          xpath=//p/span[text()='demo_6']
${WOMEN_HEADER}                     xpath=//h1/span[contains(text(),'Women')]
${BLOUSE}                           xpath=//a[@class='product-name' and @title='Blouse']
${REFERENCE_BLOUSE}                 xpath=//span[text()='demo_2']

*** Keywords ***
Verify Page Loaded
    [Arguments]     ${element}
    Wait Until Page Contains Element   ${element}

Choose Product
    [Arguments]     ${product}
    Wait Until Page Contains Element    ${product}
    Click Element                       ${product}

Verify Search Listing Load
    Wait Until Page Contains Element   ${RESULT_COUNT_ELEMENT}

Verify Result Count
    [Arguments]     ${expected_count}
    ${Product_Count}=   Get Element Count   ${SEARCH_RESULT_LIST}
    Should Be True     ${Product_Count}==${expected_count}