*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${CHILDPAGE_LOGO}                   xpath=//h1[text()='Documents request']
${WEB_ELEMENT_CONTAINING_EMAIL}     xpath=//p[@class='im-para red']
${ACTUAL_EMAIL}                     mentor@rahulshettyacademy.com
${SYMBOL}                           @
${EMAIL_CHILD}

*** Keywords ***

Verify load
    wait until page contains element    ${CHILDPAGE_LOGO}

Extract email address from page
    ${text}=        get text                        ${WEB_ELEMENT_CONTAINING_EMAIL}
    @{text_list}=   split string                    ${text}     ${SPACE}
    ${index}=       Find the index of list item     ${SYMBOL}   ${text_list}
    ${email}=       set variable                    ${text_list}[${index}]
    RETURN    ${email}

Find the index of list item
    [Arguments]    ${symbol}    ${list}
    ${matches}=    Evaluate    [i for i, item in enumerate(${list}) if '${symbol}' in item]
    IF    ${matches}
        ${index}=   Set Variable   ${matches}[0]
    ELSE
        Fail    No element containing '${symbol}' found in the list.
    END
    RETURN    ${index}

Verify email address
    [Arguments]     ${email}
    should be equal as strings      ${email}        ${ACTUAL_EMAIL}
    set global variable             ${EMAIL_CHILD}  ${email}
