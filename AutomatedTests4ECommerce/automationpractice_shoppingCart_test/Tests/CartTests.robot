*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/CartApp.robot

Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test
Test Setup          Common.Begin Test Case

# Run the script:
# robot -d Results Tests/CartTests.robot

*** Test Cases ***
New User Can Create An Account
    Common.Generate User Information
    CartApp.Go To Sign In Page
    CartApp.Create New Account
    CartApp.Sign Out

*** Test Cases ***
Valid User Can Sign In
    CartApp.Go To Sign In Page
    CartApp.Valid Sign In
    CartApp.Sign Out

*** Test Cases ***
Can't Sign In With Wrong Password
    CartApp.Go To Sign In Page
    CartApp.Invalid Sign In

*** Test Cases ***
Can Add Dress To Cart
    CartApp.Go To Sign In Page
    CartApp.Valid Sign In
    Common.Go Home
    CartApp.View Dress Listing
    CartApp.Choose Dress
    CartApp.Add Dress To Cart

Can Add Blouse To Cart
    CartApp.View Women Page
    CartApp.Choose Blouse
    CartApp.Add Blouse To Cart

Can Remove Product from Cart
    CartApp.Go To Cart Page
    CartApp.Remove Dress From Cart

Can Proceed To Checkout
    CartApp.Go To Cart Page
    CartApp.Move To Address Step
    CartApp.Fill And Save Address Information
    CartApp.Verify Billing Address And Move To Shipping
    CartApp.Check Terms Of Service And Move to Payment
    CartApp.Verify Total Price
    CartApp.Choose Payment Method And Move To Confirmation
    CartApp.Confirm Order