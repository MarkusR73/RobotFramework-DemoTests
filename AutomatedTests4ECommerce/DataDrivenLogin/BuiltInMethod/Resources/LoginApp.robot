*** Settings ***
Resource    PO/LoginPage.robot

*** Keywords ***
Test multiple login scenarios
    [Arguments]     ${credentials}
    Common.Begin Test Case
    LoginPage.Attempt login with current credentials    ${credentials}
    LoginPage.Verify login success                      ${credentials}
    Common.End Test Case