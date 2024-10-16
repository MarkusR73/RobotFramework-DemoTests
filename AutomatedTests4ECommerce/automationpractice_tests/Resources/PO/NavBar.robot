*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]
${SIGN_OUT_LINK}                    xpath=//div/a[contains(text(),'Sign out')]
${SEARCH_BOX}                       id=search_query_top
${SEARCH_BUTTON}                    xpath=//button[@name='submit_search']
${DRESSES_LINK}                     xpath=//div[6]/ul/li[2]/a[@title='Dresses']
${WOMEN_LINK}                       xpath=//a[@title="Women"]
${CART_LINK}                        xpath=//b[text()='Cart']
${HOME_ICON}                        xpath=//a[@title='Return to Home']

${SEARCH_TERM}                      dress

*** Keywords ***
Navigate To
    [Arguments]     ${bar_element}
    Wait Until Element Is Enabled   ${bar_element}
    Click Element                   ${bar_element}

Input Search Term
    [Arguments]     ${search_term}
    Input Text      ${SEARCH_BOX}   ${search_term}