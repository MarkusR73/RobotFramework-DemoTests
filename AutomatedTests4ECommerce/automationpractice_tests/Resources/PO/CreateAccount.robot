*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${REGISTRATION_FORM_HEADER}         xpath=//h3[contains(text(),'Your personal information')]
${GENDER_MR_CHECKBOX}               id=id_gender1
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

Select Gender
    [Arguments]     ${locator}
    Click Element   ${locator}

Input Name Information
    [Arguments]     ${first_name}   ${last_name}
    Input Text  ${FIRSTNAME_FIELD}      ${first_name}
    Input Text  ${LASTNAME_FIELD}       ${last_name}

Input Password
    [Arguments]     ${password}
     Input Text  ${PASSWORD_FIELD}       ${password}

Select Date Of Birth
    [Arguments]     ${day}   ${month}   ${year}
    Select From List By Value    ${BIRTHDAY_SELECTOR}       ${day}
    Select From List By Value    ${BIRTH_MONTH_SELECTOR}    ${month}
    Select From List By Value    ${BIRTH_YEAR_SELECTOR}     ${year}

Submit Account Information
    Click Button   ${REGISTER_BUTTON}