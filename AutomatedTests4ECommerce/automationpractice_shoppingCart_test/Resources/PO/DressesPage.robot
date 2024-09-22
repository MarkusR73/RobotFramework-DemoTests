*** Settings ***
Resource    ../CartKeywords.robot
Library     SeleniumLibrary

*** Variables ***
${PRODUCT_LIST_COUNT}               xpath=//div[2]/div[2][@class='product-count']
${CHOSEN_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${PRODUCT_LIST_COUNT}

Choose Dress
    Click Or Scroll             ${CHOSEN_DRESS}