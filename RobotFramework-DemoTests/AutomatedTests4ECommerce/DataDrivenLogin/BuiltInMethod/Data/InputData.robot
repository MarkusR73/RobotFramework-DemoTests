*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/PO/LoginPage.robot

*** Variables ***
&{UNREGISTERED_USER}    USERNAME=Toljanteri     PASSWORD=Toljanteri99   MESSAGE_LOCATOR=${ERROR_MESSAGE_LOCATOR}            MESSAGE=Invalid credentials
&{INVALID_PASSWORD}     USERNAME=Admin          PASSWORD=wrong          MESSAGE_LOCATOR=${ERROR_MESSAGE_LOCATOR}            MESSAGE=Invalid credentials
&{BLANK_CREDENTIALS}    USERNAME=               PASSWORD=               MESSAGE_LOCATOR=${EMAIL_REQUIRED_ALERT_LOCATOR}     MESSAGE=Required
&{VALID_CREDENTIALS}    USERNAME=Admin          PASSWORD=admin123       MESSAGE_LOCATOR=${DASHBOARD_TEXT_LOCATOR}           MESSAGE=Dashboard

