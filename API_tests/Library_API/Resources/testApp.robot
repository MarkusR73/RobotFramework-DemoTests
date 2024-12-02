*** Settings ***
Resource    API/openLibrary.robot
Resource    PO/bookPage.robot
Resource    API/academy.robot
Resource    common.robot

*** Variables ***
${SEARCH_TITLE}
@{BOOK_INFORMATION}         None
${API_RESPONSE}

*** Keywords ***
Open random book
    bookPage.Open page
    bookPage.Verify load
    bookPage.Parse book title from url

Fetch Book Info By Title
    openLibrary.Fetch book data    ${SEARCH_TITLE}

Process Retrieved Book Data
    @{data}=    openLibrary.Parse data from response    ${API_RESPONSE}
    Set Global Variable    ${BOOK_INFORMATION}    ${data}

Post Book Info
    academy.Add book to library    ${BOOK_INFORMATION}[0]    ${BOOK_INFORMATION}[1]

Verify response status
    [Arguments]     ${expected_status_code}=200
    #${response}=    run keyword if      '${response}'== 'None'    common.Get API Response
    Log    ${API_RESPONSE.status_code}
    common.Validate Response Status     ${API_RESPONSE}    ${expected_status_code}
