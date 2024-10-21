*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Resource    PO/LoginPage.robot

*** Keywords ***
Begin Web Test
    Select Browser

Begin Test Case
    LoginPage.Navigate to
    Maximize Browser Window

End Test Case
    Close Browser

End Web Test
    Close All Browsers

Select Browser
    # Present a dropdown for browser selection
    ${browser} =  Get Selection From User  Select a browser  firefox  edge  chrome
    # Makes browser available globally
    Set Global Variable  ${BROWSER}   ${browser}
