*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${REGISTRATION_FORM_HEADER}         xpath=//h3[contains(text(),'Your personal information')]
${Title_MR}                         id=id_gender1
${FIRSTNAME_FIELD}                  id=customer_firstname
${LASTNAME_FIELD}                   id=customer_lastname
${PASSWORD_FIELD}                   id=passwd
${BIRTHDAY_SELECTOR}                id=days
${BIRTH_MONTH_SELECTOR}             id=months
${BIRTH_YEAR_SELECTOR}              id=years
${REGISTER_BUTTON}                  id=submitAccount

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element   ${REGISTRATION_FORM_HEADER}

Select "Title"
    [Arguments]     ${locator}
    Click Element   ${locator}

Fill "First name" Field
    [Arguments]     ${first_name}
    Input Text  ${FIRSTNAME_FIELD}      ${first_name}

Fill "Last name" Field
    [Arguments]     ${last_name}
    Input Text  ${LASTNAME_FIELD}       ${last_name}

Fill "Password" Field
    [Arguments]     ${password}
     Input Text  ${PASSWORD_FIELD}       ${password}

Select "Date Of Birth"
    [Arguments]     ${day}   ${month}   ${year}
    Select From List By Value    ${BIRTHDAY_SELECTOR}       ${day}
    Select From List By Value    ${BIRTH_MONTH_SELECTOR}    ${month}
    Select From List By Value    ${BIRTH_YEAR_SELECTOR}     ${year}

Click "Register" Button
    Click Button   ${REGISTER_BUTTON}