*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/TestApp.robot

Test Setup         Common.Begin Test Case
Test Teardown      Common.End Test Case

# Run the script:
# robot -d Results Tests/Tests.robot

*** Test Cases ***
New User Should Be Able To Create An Account
    # robot -d Results -i 0001 Tests/Tests.robot
    [Tags]  0001    Login   Search  Add/Remove  Checkout
    Common.Generate User Information
    TestApp.Begin Account Creation
    TestApp.Fill In User Information
    TestApp.Submit User Information Form
    TestApp.Sign Out

User Should Be Able To Sign In With Valid Credentials
    # robot -d Results -i Login Tests/Tests.robot
    [Tags]  0002    Login
    TestApp.Sign In With Valid Credentials
    TestApp.Sign Out

User Shouldn't Be Able To Sign In With Invalid Credentials
    # robot -d Results -i Login Tests/Tests.robot
    [Tags]  0003    Login
    TestApp.Sign In With Invalid Credentials

User Should Be Able To Search For Products
    # robot -d Results -i Search Tests/Tests.robot
    [Tags]  0004    Search
    TestApp.Search For Product              ${SEARCH_TERM}
    TestApp.Verify Search Results

Signed In User Should Be Able To Search For Products
    # robot -d Results -i Search Tests/Tests.robot
    [Tags]  0005    Search
    TestApp.Sign In With Valid Credentials
    TestApp.Search For Product              ${SEARCH_TERM}
    TestApp.Verify Search Results

User Should Be Able To Add Product To Cart
    # robot -d Results -i Add Tests/Tests.robot
    [Tags]  0006    Add
    TestApp.Move To Product Listing         ${DRESSES_LINK}     ${DRESSES_HEADER}
    TestApp.Choose Product From Listing     ${SUMMER_DRESS}     ${REFERENCE_SUMMER_DRESS}
    TestApp.Add Product To Cart

User Should Be Able To Remove Product From Cart
    # robot -d Results -i Remover Tests/Tests.robot
    [Tags]  0007    Remove
    TestApp.Move To Product Listing         ${DRESSES_LINK}     ${DRESSES_HEADER}
    TestApp.Choose Product From Listing     ${SUMMER_DRESS}     ${REFERENCE_SUMMER_DRESS}
    TestApp.Add Product To Cart
    TestApp.View My Shopping Cart
    TestApp.Remove Product From Cart        ${DELETE_ICON_DRESS}

User Should Be Able To Proceed To Checkout
    # robot -d Results -i Checkout Tests/Tests.robot
    [Tags]  0008    Checkout
    TestApp.Sign In With Valid Credentials
    TestApp.Move To Product Listing         ${WOMEN_LINK}       ${WOMEN_HEADER}
    TestApp.Choose Product From Listing     ${BLOUSE}           ${REFERENCE_BLOUSE}
    TestApp.Add Product To Cart
    TestApp.View My Shopping Cart
    TestApp.Begin Checkout Process
    TestApp.Fill Address Information
    TestApp.Verify Billing Address
    TestApp.Move To Shipping Step
    TestApp.Check Terms Of Service
    TestApp.Move To Payment Step
    TestApp.Verify Total Price
    TestApp.Choose Payment Method
    TestApp.Confirm Order