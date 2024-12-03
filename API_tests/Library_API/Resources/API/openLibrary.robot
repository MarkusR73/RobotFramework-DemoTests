*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Resource        ../common.robot

*** Variables ***
${OPENLIBRARY_API_SEARCH_URL}       https://openlibrary.org/search.json?q=
@{BOOK_INFORMATION}                 None

*** Keywords ***
Fetch Book Data
    [Arguments]  ${title}
    ${url}=    Build url    ${OPENLIBRARY_API_SEARCH_URL}  ${title}
    Execute GET request     ${url}

Execute GET request
    [Arguments]     ${url}
    ${response}=  GET  ${url}
    Set Global Variable  ${API_RESPONSE}  ${response}

Parse data from response
    [Arguments]     ${response}
    ${docs}=            get from dictionary             ${response.json()}          docs
    ${first_doc}=       get from list                   ${docs}                     0
    ${title}=           get from dictionary             ${first_doc}                title
    ${status}=          Run Keyword And Return Status       Get From Dictionary     ${first_doc}    author_name
    IF  ${status}
        ${authors}=         get from dictionary             ${first_doc}            author_name
        ${author_name}=     set variable                    ${authors}[0]
    ELSE
        ${author_name}=     set variable                Unknown
    END
    RETURN    ${title}  ${author_name}

Save parsed book infos
    [Arguments]     ${data}
    Set Global Variable    ${BOOK_INFORMATION}    ${data}
