*** Settings ***
Resource    PO/Home.robot
Library     RandomRegistration.py
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
&{USER_INFORMATION}     FIRSTNAME=None  LASTNAME=None   EMAIL=None     PASSWORD=None    BIRTHDAY=1  BIRTH_MONTH=1   BIRTH_YEAR=2000     ADDRESS=None    CITY=None   STATE=1  POSTCODE=90500  COUNTRY=21  PHONE_NUM=+358 666 5555

*** Keywords ***
Begin Test Case
    Open Browser    about:blank    ${BROWSER}
    Home.Open Page
    Maximize Browser Window

End Test Case
    Close All Browsers

Generate User Information
    ${USER_INFORMATION.EMAIL}=      Generate Random Email
    ${USER_INFORMATION.FIRSTNAME}=  Generate Random String
    ${USER_INFORMATION.LASTNAME}=   Generate Random String
    ${USER_INFORMATION.PASSWORD}=   Generate Random String
    ${USER_INFORMATION.ADDRESS}=    Generate Random String
    ${USER_INFORMATION.CITY}=       Generate Random String