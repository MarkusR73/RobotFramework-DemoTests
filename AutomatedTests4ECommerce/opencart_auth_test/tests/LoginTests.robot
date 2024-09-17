*** Settings ***
Resource    LoginResources.robot
Test Teardown    Close Browser

*** Test Cases ***
Valid User Can Login
    Open Login Page
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Logout

Invalid User Can't Login
    Open Login Page
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Error
