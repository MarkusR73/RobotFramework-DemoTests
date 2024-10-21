*** Settings ***
Resource    PO/LoginPage.robot
Resource    Common.robot

*** Keywords ***
Login with multiple credentials
    [Arguments]      ${Login_Scenarios}
    FOR    ${login_scenario}    IN      @{Login_Scenarios}
        Common.Begin Test Case
        LoginPage.Attempt login with current credentials    ${login_scenario}
        LoginPage.Verify login success                      ${login_scenario}
        Common.End Test Case
    END