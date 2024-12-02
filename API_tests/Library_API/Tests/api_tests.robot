*** Settings ***
Resource    ../Resources/testApp.robot

Test Setup      common.Begin web test
Test Teardown   common.End web test

# Run tests
# robot -d Results Tests/api_tests.robot

*** Test Cases ***
Should be able to retrieve book information
    testApp.Open random book
    testApp.Fetch book info by title
    testApp.Verify response status

Should be able to post retrieved book information
    testApp.Process retrieved book data
    testApp.Post book info
    testApp.Verify response status
