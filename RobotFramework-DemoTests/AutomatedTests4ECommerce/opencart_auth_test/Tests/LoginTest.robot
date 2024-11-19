*** Settings ***
Resource    ../Resources/Login.robot
Resource    ../Resources/common.robot
Test Setup      common.Begin Web Test
Test Teardown   common.End Web Test

# Run the script:
# robot -d Results Tests/LoginTest.robot

*** Test Cases ***
Valid User Can Login
    Login.Open Login Page
    Login.Login With Credentials
    Login.Account Logout

Invalid User Can't Login
    Login.Open Login Page
    Login.Login With Invalid Credentials
    Login.Verify Login Failure