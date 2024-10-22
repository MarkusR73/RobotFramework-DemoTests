*** Settings ***
Resource    PO/BackOffice.LandingPage.robot

*** Keywords ***
Go to landing page
    BackOffice.LandingPage.Navigate to
    BackOffice.LandingPage.Verify page loaded
