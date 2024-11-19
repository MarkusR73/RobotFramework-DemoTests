*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TOPNAV_TEAM_LINK}         xpath=//li/a[contains(text(),'Team')]

*** Keywords ***
Select "Team" page
    click element    ${TOPNAV_TEAM_LINK}