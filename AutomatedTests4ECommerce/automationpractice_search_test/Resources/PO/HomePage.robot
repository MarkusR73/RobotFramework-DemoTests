*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${SEARCH_BOX}                       id=search_query_top
${SEARCH_BUTTON}                    xpath=//button[@type='submit']
${SEARCH_TERM}                      dress

*** Keywords ***
Open Page
    Go To    ${URL}
    Maximize Browser Window

Verify Load
    Wait until Page Contains Element   ${SEARCH_BOX}

Input Search Term
    Input Text Letter By Letter  ${SEARCH_BOX}   ${SEARCH_TERM}

Execute Search
    Press Keys    ${SEARCH_BOX}    ENTER

Input Text Letter By Letter
    [Arguments]    ${locator}    ${text}
    # Convert the SEARCH_TERM into a list of individual characters
    ${chars}=    Evaluate    list('${text}')

    # Type each character one by one and add a small delay after each one
    FOR    ${char}    IN    @{chars}
        Press Keys    ${locator}    ${char}
        Sleep    0.1s
    END