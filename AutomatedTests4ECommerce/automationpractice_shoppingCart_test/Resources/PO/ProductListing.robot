*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
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