*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]
${SEARCH_BOX}                       id=search_query_top
${SEARCH_BUTTON}                    xpath=//button[@type='submit']
${DRESSES_LINK}                     xpath=//div[6]/ul/li[2]/a[@title='Dresses']
${WOMEN_LINK}                       xpath=//a[@title="Women"]
${CART_LINK}                        xpath=//b[text()='Cart']

*** Keywords ***
Click Sign In Link
    Click Element   ${SIGN_IN_LINK}

Input Search Term
    [Arguments]     ${search_term}
    Input Text      ${SEARCH_BOX}   ${search_term}

Execute Search
    Press Keys    ${SEARCH_BOX}    ENTER

Click Dresses Link
    Click Element   ${DRESSES_LINK}

Click Women Link
    Click Element   ${WOMEN_LINK}

Click Cart Link
    Click Element   ${CART_LINK}