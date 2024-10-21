*** Settings ***
Documentation       Demonstrate benefit of data-driven testing
Resource            ../Data/InputData.robot
Resource            ../Resources/Common.robot
Resource            ../Resources/LoginApp.robot
Resource            ../Data/InputData.robot
Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test

# Run the script:
# robot -d BuiltInMethod/Results BuiltInMethod/Tests/Login.robot

*** Test Cases ***
Invalid login scenarios should display correct error messages
    [Template]      LoginApp.Test multiple login scenarios
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD}
    ${BLANK_CREDENTIALS}

Valid user should be able to login
    [Template]      LoginApp.Test multiple login scenarios
    ${VALID_CREDENTIALS}
