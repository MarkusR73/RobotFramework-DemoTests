*** Settings ***
Resource    SearchResources.robot
Resource    SearchKeywords.robot
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Search For A Product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait until Page Contains Element   ${SEARCH_BOX}

    # Enter the search term letter by letter and start the search with ENTER
    Input Text Letter By Letter  ${SEARCH_BOX}   ${SEARCH_TERM}
    Press Keys    ${SEARCH_BOX}    ENTER
    
    # Wait until the search result count element is visible
    Wait Until Page Contains Element   ${RESULT_COUNT_ELEMENT}
    ${Product_Count}=   Get Element Count   ${SEARCH_RESULT_LIST}
    Should Be True     ${Product_Count}==${EXPECTED_RESULT_COUNT}         

    Close Browser