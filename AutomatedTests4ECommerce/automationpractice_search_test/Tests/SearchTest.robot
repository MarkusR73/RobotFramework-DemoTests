*** Settings ***
Resource        ../Resources/Search.robot
Resource        ../Resources/Common.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

# Run the script:
# robot -d Results Tests/SearchTest.robot

*** Test Cases ***
Search For A Product
    Home Page Should Open
    Search Should Be executed
    Verify Search Results