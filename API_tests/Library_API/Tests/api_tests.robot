*** Settings ***
Resource    ../Resources/testApp.robot

Suite Teardown   common.End web test

# Run tests
# robot --exitonfailure -d Results Tests/api_tests.robot

*** Test Cases ***
Should be able to retrieve book information from API
    common.Begin web test
    testApp.Open random book
    testApp.Fetch book info by title

Should be able to post retrieved book information to another API
    testApp.Process retrieved book data
    testApp.Post book info
    testApp.Validate response

Should be able to retrieve posted book information
    testApp.Fetch book info by id
    testApp.Validate response
