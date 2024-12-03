*** Settings ***
Resource    PO/bookPage.robot
Resource    API/openLibrary.robot
Resource    API/academy.robot
Resource    common.robot

*** Variables ***
${SEARCH_TITLE}
${EXPECTED_STATUS_CODE}     200
${API_RESPONSE}             None

*** Keywords ***
Open random book
    bookPage.Open page
    bookPage.Verify load
    bookPage.Parse book title from url

Fetch Book Info By Title
    openLibrary.Fetch book data         ${SEARCH_TITLE}
    common.Validate response status     ${API_RESPONSE}     ${EXPECTED_STATUS_CODE}

Process Retrieved Book Data
    @{data}=    openLibrary.Parse data from response    ${API_RESPONSE}
    Save parsed book infos  ${data}

Post Book Info
    academy.Add book to library    ${BOOK_INFORMATION}[0]    ${BOOK_INFORMATION}[1]

Validate response
    common.Validate Response Status     ${API_RESPONSE}     ${EXPECTED_STATUS_CODE}
    common.Validate response data       ${API_RESPONSE}

Fetch book info by id
    academy.Parse book id from response data
    academy.Get book by id

Delete book info by id
    academy.Delete request by id

Validate delete response
    common.Validate response status     ${API_RESPONSE}     ${EXPECTED_STATUS_CODE}
