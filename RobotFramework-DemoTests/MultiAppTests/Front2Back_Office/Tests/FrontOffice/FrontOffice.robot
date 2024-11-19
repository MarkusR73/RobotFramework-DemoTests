*** Settings ***
Documentation   This suite ensures the correct behavior and content of the FrontOffice pages.
Resource    ../../Resources/Common/CommonWeb.robot
Resource    ../../Resources/FrontOffice/FrontOfficeApp.robot

Test Setup      Begin web test
Test Teardown   End web test

# Run the script:
# robot -d Results Tests/FrontOffice/FrontOffice.robot

*** Test Cases ***
Should be able to access "Team" page
    [Documentation]     Test the reachability of the Front-Office team page.
    [Tags]  0002
    FrontOfficeApp.Go to landing page
    FrontOfficeApp.Go to "Team" page

"Team" page should match requirements
    [Documentation]     Test the validity of the Front-Office team page.
    [Tags]  0003
    FrontOfficeApp.Go to landing page
    FrontOfficeApp.Go to "Team" page
    FrontOfficeApp.Validate "Team" page