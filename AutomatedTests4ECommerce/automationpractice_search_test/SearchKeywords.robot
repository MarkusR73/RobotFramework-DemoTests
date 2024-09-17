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