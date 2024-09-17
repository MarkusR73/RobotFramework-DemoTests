*** Settings ***
Resource    SearchResources.robot
Resource    SearchKeywords.robot
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Search For A Product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait until Element Is Visible   ${SEARCH_BOX}

    # Enter the search term letter by letter and start the search with ENTER
    Input Text Letter By Letter  ${SEARCH_BOX}   ${SEARCH_TERM}
    Press Keys    ${SEARCH_BOX}    ENTER
    
    # Wait until the search result count element is visible
    Wait Until Element Is Visible   ${RESULT_COUNT_ELEMENT}

    # Get the text that contains the number of results ("Showing 1 - 7 of 7 items")
    ${result_text}=    Get Text    ${RESULT_COUNT_ELEMENT}

    # Extract the second-to-last word representing the total number of results
    ${number_of_results}=    Evaluate    int(${result_text.split()[-2]})

    # Verify the number of results
    Should Be Equal As Numbers    ${number_of_results}    ${EXPECTED_RESULT_COUNT}

    Close Browser