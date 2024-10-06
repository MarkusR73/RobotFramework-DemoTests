*** Settings ***
Resource    PO/Home.robot
Library     RandomRegistration.py
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
&{USER_INFORMATION}     FIRSTNAME=None  LASTNAME=None   EMAIL=None     PASSWORD=None    BIRTHDAY=1  BIRTH_MONTH=1   BIRTH_YEAR=2000     ADDRESS=None    CITY=None   STATE=1  POSTCODE=90500  COUNTRY=21  PHONE_NUM=+358 666 5555

*** Keywords ***
Begin Web Test
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

Begin Test Case
    Home.Open Page

Generate User Information
    ${USER_INFORMATION.EMAIL}=      Generate Random Email
    ${USER_INFORMATION.FIRSTNAME}=  Generate Random String
    ${USER_INFORMATION.LASTNAME}=   Generate Random String
    ${USER_INFORMATION.PASSWORD}=   Generate Random String
    ${USER_INFORMATION.ADDRESS}=    Generate Random String
    ${USER_INFORMATION.CITY}=       Generate Random String

# Try to click the desired element. If not clickable, scroll and try again
Click Or Scroll
    [Arguments]    ${locator}
    ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
    # Only if the initial click attempt fails, start scrolling and retrying
    Run Keyword If    not ${is_clickable}    Scroll And Click Element    ${locator}

#Scroll down and try to click desired element
Scroll And Click Element
    [Arguments]    ${locator}
    # Try up to 10 times to scroll and click the desired element
    FOR    ${index}    IN RANGE    0    10
        # Scroll down by 300 pixels
        Execute Javascript    window.scrollBy(0, 300)
        Sleep    0.5s
        # Attempt to click the element and capture the status
        ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
        # Exit the loop if the click was successful
        Exit For Loop If    ${is_clickable}
    END
    # Fail the test if the element was not clicked successfully
    Run Keyword If    not ${is_clickable}    Fail    Unable to click element with locator '${locator}' after scrolling.