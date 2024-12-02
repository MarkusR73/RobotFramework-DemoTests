*** Settings ***
Library     SeleniumLibrary
Library     String

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

Extract text from url
    [Arguments]    ${url}   ${splitter}     ${index}
    @{parts}=       split string        ${url}      ${splitter}
    RETURN          ${parts}[${index}]

Replace string separator
    [Arguments]     ${text}     ${old_sep}      ${new_sep}
    ${text}=        Replace String      ${text}        ${old_sep}    ${new_sep}
    RETURN          ${text}
