*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Resource        ../common.robot

*** Variables ***
${OPENLIBRARY_API_SEARCH_URL}       https://openlibrary.org/search.json?q=

*** Keywords ***
Fetch Book Data
    [Arguments]  ${title}
    ${url}=    Build url  ${OPENLIBRARY_API_SEARCH_URL}  ${title}
    ${response}=  GET  ${url}
    Log  ${response.json()}
    Set Global Variable  ${API_RESPONSE}  ${response}

Parse data from response
    [Arguments]     ${response}
    ${docs}=            get from dictionary     ${response.json()}          docs
    ${first_doc}=       get from list           ${docs}                     0
    ${title}=           get from dictionary     ${first_doc}                title
    ${author_name}=     get from dictionary     ${first_doc}                author_name
    RETURN    ${title}  ${author_name}[0]