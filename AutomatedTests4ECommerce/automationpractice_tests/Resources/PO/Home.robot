*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${HOMEPAGE_SLIDER}                  //div[@id='homepage-slider']


*** Keywords ***
Open Page
    Open Browser   ${URL}   ${BROWSER}

Verify Load
    ${passed} =     run keyword and return status    Wait Until Page Contains Element   ${HOMEPAGE_SLIDER}
    Run Keyword If    '${passed}' == 'false'    Exit For Suite    Failed to load the homepage