*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${HOMEPAGE_SLIDER}                  //div[@id='homepage-slider']
${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]
${DRESSES_LINK}                     xpath=//div[6]/ul/li[2]/a[@title='Dresses']

*** Keywords ***
Open Page
    Go To   ${URL}

Verify Load
    Wait Until Page Contains Element   ${HOMEPAGE_SLIDER}

Click Sign In Link
    Click Element   ${SIGN_IN_LINK}

Click Dresses Link
    Click Element   ${DRESSES_LINK}