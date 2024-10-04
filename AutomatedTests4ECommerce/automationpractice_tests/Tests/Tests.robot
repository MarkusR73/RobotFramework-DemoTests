*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/TestApp.robot

Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test
Test Setup          Common.Begin Test Case

# Run the script:
# robot -d Results Tests/Tests.robot

*** Test Cases ***
New User Can Create An Account
    Common.Generate User Information
    TestApp.Go To Sign In Page
    TestApp.Create New Account
    TestApp.Sign Out

Valid User Can Sign In
    TestApp.Go To Sign In Page
    TestApp.Valid Sign In
    TestApp.Sign Out

Can't Sign In With Wrong Password
    TestApp.Go To Sign In Page
    TestApp.Invalid Sign In

User Can Search For Products
    TestApp.Execute Search
    TestApp.Verify Search Results

Can Add Dress To Cart
    TestApp.Go To Sign In Page
    TestApp.Valid Sign In
    Common.Go Home
    TestApp.View Dress Listing
    TestApp.Choose Dress
    TestApp.Add Dress To Cart

Can Add Blouse To Cart
    TestApp.View Women Page
    TestApp.Choose Blouse
    TestApp.Add Blouse To Cart

Can Remove Product from Cart
    TestApp.Go To Cart Page
    TestApp.Remove Dress From Cart

Can Proceed To Checkout
    TestApp.Go To Cart Page
    TestApp.Move To Address Step
    TestApp.Fill And Save Address Information
    TestApp.Verify Billing Address And Move To Shipping
    TestApp.Check Terms Of Service And Move to Payment
    TestApp.Verify Total Price
    TestApp.Choose Payment Method And Move To Confirmation
    TestApp.Confirm Order