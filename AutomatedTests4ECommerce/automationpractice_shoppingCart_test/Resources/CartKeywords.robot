*** Settings ***
Resource    CartResources.robot
Library    RandomRegistration.py
Library    SeleniumLibrary

*** Keywords ***
Generate User Information
    [Arguments]
    ${USER_INFORMATION.EMAIL}=      Generate Random Email
    ${USER_INFORMATION.FIRSTNAME}=  Generate Random String
    ${USER_INFORMATION.LASTNAME}=   Generate Random String
    ${USER_INFORMATION.PASSWORD}=   Generate Random String
    ${USER_INFORMATION.ADDRESS}=    Generate Random String
    ${USER_INFORMATION.CITY}=       Generate Random String

Open Browser And Go To URL
    Open Browser    ${URL}    ${BROWSER}

Try To Sign In
    [Arguments]     ${email}    ${password}
    # Wait until page fully loaded
    Wait Until Page Contains Element   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Page Contains Element   ${LOCK_ICON}
    Input Text  ${LOGIN_EMAIL_FIELD}    ${email}
    Input Text  ${LOGIN_PASSWORD_FIELD}   ${password}
    Click Element   ${LOCK_ICON}

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

Wait Until Expected Value Is Visible
    [Arguments]  ${expected_value}  ${locator}
    # Retry up to 10 times with a 1-second interval
    FOR  ${index}  IN RANGE  0  10
        # Retrieve the current value from the element
        ${current_value}=  Get Text   ${locator}
        # Check if the current value matches the expected value
        Run Keyword If  '${current_value}' == '${expected_value}'  Exit For Loop
        Sleep  1s
    END
    # Fail the test if the value is not updated
    Should Be True    '${current_value}' == '${expected_value}'    Expected value '${expected_value}' not found for locator '${locator}'