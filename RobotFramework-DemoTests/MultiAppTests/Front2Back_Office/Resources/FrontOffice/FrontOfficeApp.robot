*** Settings ***
Resource    PO/FrontOffice.TopNav.robot
Resource    PO/FrontOffice.LandingPage.robot
Resource    Po/FrontOffice.TeamPage.robot

*** Keywords ***
Go to landing page
    FrontOffice.LandingPage.Navigate to
    FrontOffice.LandingPage.Verify page loaded

Go to "Team" page
    FrontOffice.TopNav.Select "Team" page
    FrontOffice.TeamPage.Verify page loaded

Validate "Team" page
    FrontOffice.TeamPage.Validate page contents