*** Settings ***
Resource    ../CartKeywords.robot
Library     SeleniumLibrary

*** Variables ***
${YOUR_ADDRESSES_HEADER}            xpath=//h1[text()='Your addresses']
${ADDRESS_FIELD}                    id=address1
${CITY_FIELD}                       id=city
${STATE_LIST}                       id=id_state
${POSTCODE_FIELD}                   id=postcode
${COUNTRY_LIST}                     id=id_country
${HOME_PHONE_FIELD}                 id=phone
${SAVE_BUTTON}                      id=submitAddress

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${YOUR_ADDRESSES_HEADER}

Fill Address Info
    Input Text                          ${ADDRESS_FIELD}            ${USER_INFORMATION.ADDRESS}
    Input Text                          ${CITY_FIELD}               ${USER_INFORMATION.CITY}
    Select From List By Value           ${STATE_LIST}               ${USER_INFORMATION.STATE}
    Input Text                          ${POSTCODE_FIELD}           ${USER_INFORMATION.POSTCODE}
    Select From List By Value           ${COUNTRY_LIST}             ${USER_INFORMATION.COUNTRY}
    Input Text                          ${HOME_PHONE_FIELD}         ${USER_INFORMATION.PHONE_NUM}

Save Address Info
    Click Button   ${SAVE_BUTTON}