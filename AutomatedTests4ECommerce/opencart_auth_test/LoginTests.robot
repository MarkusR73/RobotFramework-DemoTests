*** Settings ***
Resource    LoginResources.robot
Resource    LoginKeywords.robot
Test Teardown    Close Browser

*** Test Cases ***
Valid User Can Login
    Open Login Page
    Login With Credentials    ${USER_INFORMATION.USERNAME}    ${USER_INFORMATION.PASSWORD}
    Logout

Invalid User Can't Login
    Open Login Page
    Login With Credentials    ${INVALID_USER_INFORMATION.USERNAME}    ${INVALID_USER_INFORMATION.PASSWORD}
    Verify Login Error
