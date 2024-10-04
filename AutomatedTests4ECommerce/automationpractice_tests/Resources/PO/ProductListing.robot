*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${RESULT_COUNT_ELEMENT}             xpath=//div[@class='product-count']
${SEARCH_RESULT_LIST}               //ul[@class='product_list grid row']/li
${EXPECTED_RESULT_COUNT}            7

${DRESSES_HEADER}                   xpath=//span[text()='Dresses']
${CHOSEN_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']

${WOMEN_HEADER}                     xpath=//h1/span[contains(text(),'Women')]
${BLOUSE_LINK}                      xpath=//a[@class='product-name' and @title='Blouse']

*** Keywords ***
Verify Dress Listing Load
    Wait Until Page Contains Element   ${DRESSES_HEADER}

Choose Dress
    Common.Click Or Scroll             ${CHOSEN_DRESS}

Verify Blouse Listing Load
    Wait Until Page Contains Element   ${WOMEN_HEADER}

Choose Blouse
    Common.Click Or Scroll             ${BLOUSE_LINK}

Verify Search Listing Load
    Wait Until Page Contains Element   ${RESULT_COUNT_ELEMENT}

Verify Result Count
    ${Product_Count}=   Get Element Count   ${SEARCH_RESULT_LIST}
    Should Be True     ${Product_Count}==${EXPECTED_RESULT_COUNT}