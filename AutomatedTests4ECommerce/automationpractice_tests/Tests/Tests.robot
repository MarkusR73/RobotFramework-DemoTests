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
    Go To Sign In Page
    TestApp.Sign In With Valid Credentials
    TestApp.Sign Out

User Shouldn't Be Able To Sign In With Invalid Credentials
    Go To Sign In Page
    TestApp.Sign In With Invalid Credentials

User Can Search For Products
    Go To Sign In Page
    TestApp.Sign In With Valid Credentials
    TestApp.Execute Search
    TestApp.Verify Search Results

User Can Add Dress To Cart
    TestApp.Move To Dress Listing
    TestApp.Choose Dress
    TestApp.Add Product To Cart

Can Add Blouse To Cart
    TestApp.Move To Women Listing
    TestApp.Choose Blouse
    TestApp.Add Product To Cart

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