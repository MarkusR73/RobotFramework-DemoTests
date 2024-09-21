*** Settings ***
Resource    ../Resources/PO/LoginResources.robot
Resource    ../Resources/PO/LoginKeywords.robot
Resource    ../Resources/PO/common.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Test Cases ***
Valid User Can Login
    Open Login Page
    Login With Credentials    ${USER_INFORMATION.USERNAME}    ${USER_INFORMATION.PASSWORD}
    Logout

Invalid User Can't Login
    Open Login Page
    Login With Credentials    ${INVALID_USER_INFORMATION.USERNAME}    ${INVALID_USER_INFORMATION.PASSWORD}
    Verify Login Error
