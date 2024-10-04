*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${HOMEPAGE_SLIDER}                  //div[@id='homepage-slider']
${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]

${SEARCH_BOX}                       id=search_query_top
${SEARCH_BUTTON}                    xpath=//button[@type='submit']
${SEARCH_TERM}                      dress

${DRESSES_LINK}                     xpath=//div[6]/ul/li[2]/a[@title='Dresses']
${WOMEN_LINK}                       xpath=//a[@title="Women"]
${CART_LINK}                        xpath=//b[text()='Cart']

*** Keywords ***
Open Page
    Go To   ${URL}

Verify Load
    Wait Until Page Contains Element   ${HOMEPAGE_SLIDER}

Click Sign In Link
    Click Element   ${SIGN_IN_LINK}

Input Search Term
    Input Text      ${SEARCH_BOX}   ${SEARCH_TERM}

Execute Search
    Press Keys    ${SEARCH_BOX}    ENTER

Click Dresses Link
    Click Element   ${DRESSES_LINK}

Click Women Link
    Click Element   ${WOMEN_LINK}

Click Cart Link
    Click Element   ${CART_LINK}