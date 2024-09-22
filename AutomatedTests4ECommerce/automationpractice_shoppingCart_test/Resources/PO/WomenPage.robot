*** Settings ***
Resource    ../CartKeywords.robot
Library     SeleniumLibrary

*** Variables ***
${WOMEN_HEADER}                     xpath=//h1/span[contains(text(),'Women')]
${BLOUSE_LINK}                      xpath=//a[@class='product-name' and @title='Blouse']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${WOMEN_HEADER}

Choose Blouse
    Click Or Scroll             ${BLOUSE_LINK}