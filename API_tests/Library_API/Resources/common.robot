*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Resource    API/academy.robot

*** Variables ***
@{BROWSERS}             firefox     chrome      edge

*** Keywords ***
Begin web test
    open browser    about:blank     ${BROWSERS}[0]
    maximize browser window

End web test
    close all browsers

Build url
    [Arguments]     ${base_url}    ${path}
    ${url}=     set variable    ${base_url}${path}
    RETURN    ${url}

Validate response status
    [Arguments]    ${response}      ${expected_status_code}
    should be equal as integers    ${response.status_code}      ${expected_status_code}

Validate response data
    [Arguments]     ${response}
    ${method}=      set variable    ${response.request.method}
    IF    '${method}' == 'POST'
        dictionaries should be equal    ${response.json()}      ${EXPECTED_POST_RESPONSE_DATA}
    ELSE IF    '${method}' == 'GET'
        dictionaries should be equal    ${response.json()}[0]   ${POSTED_BOOK_INFO}
    END

Extract text from url
    [Arguments]    ${url}   ${splitter}     ${index}
    @{parts}=       split string        ${url}      ${splitter}
    RETURN          ${parts}[${index}]

Replace string separator
    [Arguments]     ${text}     ${old_sep}      ${new_sep}
    ${text}=        Replace String      ${text}        ${old_sep}    ${new_sep}
    RETURN          ${text}

Parse data by keys
    [Arguments]     ${keys}     ${json_data}
    ${len}=         get length          ${keys}
    @{values}=      create list
    FOR    ${i}     IN RANGE    ${len}
        append to list    ${values}     ${json_data}[${keys}[${i}]]
    END
    RETURN          ${values}

Verify response data
    [Arguments]     ${response_data}    ${expected_values}
    ${len}=         get length          ${response_data}
    FOR    ${i}     IN RANGE    ${len}
        Should Be Equal As Strings    ${response_data}[${i}]    ${expected_values}[${i}]
    END

Generate random number string
    ${num_str}=     Evaluate    str(random.randint(100, 100000))    random
    RETURN          ${num_str}

Concatenate
    [Arguments]     @{strings}
    ${len}=         get length          ${strings}
    ${new_string}=   set variable    ${strings}[0]
    FOR    ${i}   IN RANGE  1   ${len}
        ${new_string}=   Set Variable    ${new_string}${strings}[${i}]
    END
    RETURN    ${new_string}