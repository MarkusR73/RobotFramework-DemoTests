*** Settings ***
Resource    ../CartResources.robot
Library     SeleniumLibrary

*** Variables ***
${CREATE_AN_ACCOUNT_BUTTON}         xpath=//button[@id='SubmitCreate']
${CREATE_EMAIL_FIELD}               xpath=//input[@id='email_create']

*** Keywords ***
Verify Load
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

Input Email Address
    Input Text  ${CREATE_EMAIL_FIELD}   ${USER_INFORMATION.EMAIL}

Click Create Account Button
    Click Button   ${CREATE_AN_ACCOUNT_BUTTON}