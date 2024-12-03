*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ../common.robot
Resource        ../testApp.robot

*** Variables ***
${LIBRARY_POST_URL}                 https://rahulshettyacademy.com/Library/Addbook.php
${LIBRARY_GET_URL}                  https://rahulshettyacademy.com/Library/GetBook.php
${LIBRARY_DELETE_URL}               https://rahulshettyacademy.com/Library/DeleteBook.php
&{POSTED_BOOK_INFO}
${BOOK_ID}                          None
&{EXPECTED_POST_RESPONSE_DATA}      Msg=successfully added      ID=None

*** Keywords ***
Add book to library
    [Arguments]     ${name}     ${author}
    ${request_body}=        Generate POST request body      ${name}     ${author}
    Execute POST request    ${request_body}
    Save posted book infos  ${request_body}

Save posted book infos
    [Arguments]     ${dict}
    &{book_infos}=          create dictionary       book_name=${dict}[name]     isbn=${dict}[isbn]      aisle=${dict}[aisle]     author=${dict}[author]
    set global variable     ${POSTED_BOOK_INFO}     ${book_infos}
    ${id}=                  common.Concatenate      ${dict}[isbn]               ${dict}[aisle]
    set to dictionary       ${EXPECTED_POST_RESPONSE_DATA}                      ID                      ${id}

Execute POST request
    [Arguments]     ${body}
    ${response}=    POST    ${LIBRARY_POST_URL}     json=${body}
    set global variable     ${API_RESPONSE}         ${response}
    RETURN  ${response}

Generate POST request body
    [Arguments]     ${name}     ${author}
    ${isbn}=     Evaluate       str(random.randint(100, 100000))    random
    ${aisle}=    Evaluate       str(random.randint(100, 100000))    random
    @{key_list}=            create list             name        isbn        aisle       author
    @{value_list}           create_list             ${name}     ${isbn}     ${aisle}    ${author}
    &{request_body}=        Generate json body      ${key_list}     ${value_list}
    RETURN  ${request_body}

Generate json body
    [Arguments]     ${keys}     ${values}
    &{dict}=        create dictionary
    ${len}=         get length          ${keys}
    FOR     ${index}     IN RANGE  ${len}
        ${key}=     set variable    ${keys}[${index}]
        ${value}=   set variable    ${values}[${index}]
        ${dict}[${key}]=    set variable    ${value}
    END
    RETURN  &{dict}

Parse book id from response data
    ${keys}=                create list                 ID
    ${book_id}=             common.Parse data by keys   ${keys}         ${API_RESPONSE.json()}
    set global variable     ${BOOK_ID}                  ${book_id}

Get book by id
    ${params}=              Create Dictionary       ID=${BOOK_ID}
    ${response}=    GET     ${LIBRARY_GET_URL}      params=${params}
    set global variable     ${API_RESPONSE}         ${response}

Delete request by id
    ${response}=     POST       ${LIBRARY_DELETE_URL}   json{${BOOK_ID}}
    set global variable         ${API_RESPONSE}         ${response}
