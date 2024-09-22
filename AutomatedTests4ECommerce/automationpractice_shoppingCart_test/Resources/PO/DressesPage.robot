*** Settings ***
Resource    ../CartKeywords.robot
Library     SeleniumLibrary

*** Variables ***
${DRESSES_HEADER}                   xpath=//span[text()='Dresses']
${PRODUCT_LIST_COUNT}               xpath=//div[2]/div[2][@class='product-count']
${CHOSEN_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${DRESSES_HEADER}

Choose Dress
    Click Or Scroll             ${CHOSEN_DRESS}