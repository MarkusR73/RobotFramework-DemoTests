*** Settings ***
Resource    PO/LoginPage.robot
Resource    PO/MyAccountPage.robot
Resource    PO/AccountLogoutPage.robot

*** Keywords ***
Open Login Page
    LoginPage.Load
    LoginPage.Verify Page Loaded

Login With Credentials
    LoginPage.Login    ${USER_INFORMATION.USERNAME}    ${USER_INFORMATION.PASSWORD}

Login With Invalid Credentials
    LoginPage.Login    ${INVALID_USER_INFORMATION.USERNAME}    ${INVALID_USER_INFORMATION.PASSWORD}
    LoginPage.Verify Login Error
    
Account Logout
    MyAccountPage.Logout
    AccountLogoutPage.VerifyLogout
