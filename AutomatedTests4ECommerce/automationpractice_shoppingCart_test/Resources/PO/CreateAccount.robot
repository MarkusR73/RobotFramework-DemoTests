*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary

*** Variables ***
${REGISTRATION_FORM_HEADER}         xpath=//h3[contains(text(),'Your personal information')]
${GENDER_SELECTOR_MR}               id=id_gender1
${FIRSTNAME_FIELD}                  id=customer_firstname
${LASTNAME_FIELD}                   id=customer_lastname
${PASSWORD_FIELD}                   id=passwd
${BIRTHDAY_SELECTOR}                id=days
${BIRTH_MONTH_SELECTOR}             id=months
${BIRTH_YEAR_SELECTOR}              id=years
${REGISTER_BUTTON}                  id=submitAccount

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${REGISTRATION_FORM_HEADER}

Select Gender
    Click Element   ${GENDER_SELECTOR_MR}
    ${Gender_Selector_Value}=    Get Element Attribute    ${GENDER_SELECTOR_MR}     checked
    Should Be Equal As Strings    ${Gender_Selector_Value}    true

Fill Name Information
    Input Text  ${FIRSTNAME_FIELD}      ${USER_INFORMATION.FIRSTNAME}
    Input Text  ${LASTNAME_FIELD}       ${USER_INFORMATION.LASTNAME}

Select Password
     Input Text  ${PASSWORD_FIELD}       ${USER_INFORMATION.PASSWORD}

Select Date Of Birth
    Select From List By Value    ${BIRTHDAY_SELECTOR}       ${USER_INFORMATION.BIRTHDAY}
    Select From List By Value    ${BIRTH_MONTH_SELECTOR}    ${USER_INFORMATION.BIRTH_MONTH}
    Select From List By Value    ${BIRTH_YEAR_SELECTOR}     ${USER_INFORMATION.BIRTH_YEAR}

Click Register
    Click Button   ${REGISTER_BUTTON}