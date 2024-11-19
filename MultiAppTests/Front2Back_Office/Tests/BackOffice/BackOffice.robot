*** Settings ***
Documentation   Suite to verify accessibility and core functionality of BackOffice web pages
Resource    ../../Resources/Common/CommonWeb.robot
Resource    ../../Resources/BackOffice/BackOfficeApp.robot

Test Setup      Begin web test
Test Teardown   End web test

# Run the script:
# robot -d Results Tests/BackOffice/BackOffice.robot

*** Test Cases ***
Should be able to access "Landing" page
    [Documentation]     Test the reachability of the Back-Office landing page.
    [Tags]  0001
    BackOfficeApp.Go to landing page
