*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${HOMEPAGE_SLIDER}                  //div[@id='homepage-slider']


*** Keywords ***
Open Page
    Go To   ${URL}

Verify Load
    Wait Until Page Contains Element   ${HOMEPAGE_SLIDER}