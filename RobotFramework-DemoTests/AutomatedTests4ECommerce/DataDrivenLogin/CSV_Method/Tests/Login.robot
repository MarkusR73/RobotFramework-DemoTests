*** Settings ***
Documentation       Demonstrate benefit of data-driven testing
Resource            ../Data/Users.csv
Resource            ../Resources/DataManager.robot
Resource            ../Resources/Common.robot
Resource            ../Resources/LoginApp.robot
Resource            ../Data/InputData.robot
Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test

# Run the script:
# robot -d CSV_Method/Results CSV_Method/Tests/Login.robot

*** Test Cases ***
Login scenarios should display correct messages
    ${LoginScenarios} =     DataManager.Get csv data    ${CREDENTIALS_PATH_CSV}
    LoginApp.Login with multiple credentials            ${LoginScenarios}


