*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TEAM_HEADER_LABEL}    xpath=//*[@id="team"]/div/div[1]/div/h2
${TEAM_HEADER_TEXT}     OUR AMAZING TEAM

*** Keywords ***
Verify page loaded
    wait until element is visible    ${TEAM_HEADER_LABEL}

Validate page contents
    ${text}=    get text            ${TEAM_HEADER_LABEL}
    should be equal as strings      ${TEAM_HEADER_TEXT}   ${text}     ignore_case=true