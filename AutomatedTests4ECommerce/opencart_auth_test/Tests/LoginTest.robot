*** Settings ***
Resource    ../Resources/Login.robot
Resource    ../Resources/common.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test

# Run the script:
# robot -d Results Tests/LoginTest.robot

*** Test Cases ***
Valid User Can Login
    Open Login Page
    Login With Credentials
    Account Logout

Invalid User Can't Login
    Open Login Page
    Login With Invalid Credentials
    Verify Login Error
