*** Settings ***
Resource    PO/Home.robot
Library     ../Libraries/RandomRegistration.py
Library     SeleniumLibrary
Library     Dialogs

*** Variables ***
&{USER_INFORMATION}     FIRSTNAME=None  LASTNAME=None   EMAIL=None     PASSWORD=None    BIRTHDAY=1  BIRTH_MONTH=1   BIRTH_YEAR=2000     ADDRESS=None    CITY=None   STATE=1  POSTCODE=90500  COUNTRY=21  PHONE_NUM=+358 666 5555

*** Keywords ***
Begin Web Test
    Select Browser

Begin Test Case
    Home.Open Page
    Home.Verify Load
    Maximize Browser Window

End Test Case
    Close Browser

End Web Test
    Close All Browsers

Select Browser
    # Present a dropdown for browser selection
    ${browser} =  Get Selection From User  Select a browser  firefox  edge  chrome
    # Makes browser available globally
    Set Global Variable  ${BROWSER}   ${browser}

Generate User Information
    ${USER_INFORMATION.EMAIL}=      Generate Random Email
    ${USER_INFORMATION.FIRSTNAME}=  Generate Random String
    ${USER_INFORMATION.LASTNAME}=   Generate Random String
    ${USER_INFORMATION.PASSWORD}=   Generate Random String
    ${USER_INFORMATION.ADDRESS}=    Generate Random String
    ${USER_INFORMATION.CITY}=       Generate Random String