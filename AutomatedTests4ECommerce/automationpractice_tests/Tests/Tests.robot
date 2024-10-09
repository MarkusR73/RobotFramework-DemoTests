*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/TestApp.robot

Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test
Test Setup          Common.Begin Test Case

# Run the script:
# robot -d Results Tests/Tests.robot

*** Test Cases ***
New User Should Be Able To Create An Account
    Common.Generate User Information
    TestApp.Go To Sign In Page
    TestApp.Begin Account Creation
    TestApp.Fill In User Information
    TestApp.Submit User Information Form
    TestApp.Sign Out

User Should Be Able To Sign In With Valid Credentials
    TestApp.Go To Sign In Page
    TestApp.Sign In With Valid Credentials
    TestApp.Sign Out

User Shouldn't Be Able To Sign In With Invalid Credentials
    TestApp.Go To Sign In Page
    TestApp.Sign In With Invalid Credentials

User Should Be Able To Search For Products
    TestApp.Search For Product              ${SEARCH_TERM}
    TestApp.Verify Search Results

Signed In User Should Be Able To Search For Products
    TestApp.Go To Sign In Page
    TestApp.Sign In With Valid Credentials
    TestApp.Search For Product              ${SEARCH_TERM}
    TestApp.Verify Search Results

User Should Be Able To Add Product To Cart
    TestApp.Move To Product Listing         ${DRESSES_LINK}     ${DRESSES_HEADER}
    TestApp.Choose Product From Listing     ${SUMMER_DRESS}     ${REFERENCE_SUMMER_DRESS}
    TestApp.Add Product To Cart

User Should Be Able To Remove Product From Cart
    TestApp.View My Shopping Cart
    TestApp.Remove Product From Cart        ${DELETE_ICON_DRESS}

User Should Be Able To Add Another Product To Cart
    TestApp.Move To Product Listing         ${WOMEN_LINK}       ${WOMEN_HEADER}
    TestApp.Choose Product From Listing     ${BLOUSE}           ${REFERENCE_BLOUSE}
    TestApp.Add Product To Cart

#User Should Be Able To Remove Prloduct From Cart
    #TestApp.View My Shopping Cart
    #TestApp.Remove Product From Cart        ${DELETE_ICON_DRESS}

User Should Be Able To Proceed To Checkout
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