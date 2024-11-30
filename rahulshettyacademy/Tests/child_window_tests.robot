*** Settings ***
Resource        ../Resources/testApp.robot
Resource        ../Resources/common.robot

Test Setup      common.Begin web test
Test Teardown   common.End web test

# Run tests:
# robot -d Results Tests/child_window_tests.robot

*** Test Cases ***
Validate child window functionality
    [Tags]  0003    child_window   smoke
    testApp.Move to login page
    testApp.Move to child window
    testApp.Extract email address from child window
    testApp.Return to login page
    testApp.Fill in extracted email    ${EMAIL_CHILD}
