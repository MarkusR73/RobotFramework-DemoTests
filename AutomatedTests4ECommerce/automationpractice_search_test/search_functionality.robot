*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${URL}                    http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

# Locators for search box, search button, and result count
${SEARCH_BOX}                       xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[2]/form/input[4]
${SEARCH_BUTTON}                    css=button.btn.btn-default
${RESULT_COUNT_ELEMENT}             xpath=/html/body/div/div[2]/div/div[3]/div[2]/div[1]/div[2]/div[2]

# Expected values
${EXPECTED_RESULT_COUNT}            7
${SEARCH_TERM}                      dress

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

*** Keywords ***
Input Text Letter By Letter
    [Arguments]    ${locator}    ${text}
    # Convert the SEARCH_TERM into a list of individual characters
    ${chars}=    Evaluate    list('${text}')

    # Type each character one by one and add a small delay after each one
    FOR    ${char}    IN    @{chars}
        Press Keys    ${locator}    ${char}
        Sleep    0.1s    
    END