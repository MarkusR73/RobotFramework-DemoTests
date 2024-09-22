*** Settings ***
Resource    PO/HomePage.robot
Resource    PO/SearchResultPage.robot
Resource    Common.robot
Library     SeleniumLibrary

*** Keywords ***
Home Page Should Open
    HomePage.Open Page
    HomePage.Verify Load

Search Should Be Executed
    HomePage.Input Search Term
    HomePage.Execute Search

Verify Search Results
    SearchResultPage.Verify Load
    SearchResultPage.Verify Result Count