*** Settings ***
Documentation   This suite tests end-to-end scenarios involving both FrontOffice and BackOffice applications.
Resource    ../../Resources/Common/CommonWeb.robot
Resource    ../../Resources/FrontOffice/FrontOfficeApp.robot
Resource    ../../Resources/BackOffice/BackOfficeApp.robot

Test Setup      Begin web test
Test Teardown   End web test

# Run the script:
# robot -d Results Tests/End2End/Scenarios.robot

*** Test Cases ***
Should be able to access both sites
    [Documentation]      Test the reachability of both landing pages.
    [Tags]  0004
    FrontOfficeApp.Go to landing page
    BackOfficeApp.Go to landing page
