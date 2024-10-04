*** Settings ***
Resource    PO/CartConfirmation.robot
Resource    PO/CartPayment.robot
Resource    PO/CartShipping.robot
Resource    PO/CartAddress.robot
Resource    PO/YourAddresses.robot
Resource    PO/CartSummary.robot
Resource    PO/Product.robot
Resource    Po/ProductListing.robot
Resource    PO/MyAccount.robot
Resource    PO/CreateAccount.robot
Resource    PO/Home.robot
Resource    PO/SignIn.robot
Resource    Common.robot

*** Keywords ***
Go To Sign In Page
    Home.Click Sign In Link
    SignIn.Verify Load

Create New Account
    SignIn.Begin Account Creation
    CreateAccount.Verify Load
    CreateAccount.Fill User Information
    CreateAccount.Click Register
    MyAccount.Verify Registration

Sign Out
    MyAccount.Sign Out
    SignIn.Verify Load

Valid Sign In
    SignIn.Fill Valid User Info
    SignIn.Try To Sign In
    MyAccount.Verify Sign In

Invalid Sign In
    SignIn.Fill Invalid User Info
    SignIn.Try To Sign In
    SignIn.Verify Error Message

View Dress Listing
    Home.Click Dresses Link
    ProductListing.Verify Dress Listing Load

Choose Dress
    ProductListing.Choose Dress
    Product.Verify Dress Page Load

Add Dress To Cart
    Product.Choose Color
    Product.Verify Availability
    Product.Add To Cart
    Product.Verify Successful Addition
    Product.Continue Shopping

View Women Page
    Home.Click Women Link
    ProductListing.Verify Blouse Listing Load

Choose Blouse
    ProductListing.Choose Blouse
    Product.Verify Blouse Page Load

Add Blouse To Cart
    Product.Choose Color
    Product.Verify Availability
    Product.Add To Cart
    Product.Verify Successful Addition
    Product.Continue Shopping

Go To Cart Page
    Home.Click Cart Link
    CartSummary.Verify Load

Remove Dress From Cart
    CartSummary.Remove Dress
    CartSummary.Verify Dress Disappearance

Move To Address Step
    CartSummary.Proceed Link Should Be Visible
    CartSummary.Click Proceed Link
    YourAddresses.Verify Load

Fill And Save Address Information
    YourAddresses.Fill Address Info
    YourAddresses.Save Address Info

Verify Billing Address And Move To Shipping
    CartAddress.Verify Load
    CartAddress.Verify Billing Address
    CartAddress.Move To Shipping

Check Terms Of Service And Move to Payment
    CartShipping.Verify Load
    CartShipping.Check Terms Box
    CartShipping.Move To Payment
    CartPayment.Verify Load

Verify Total Price
    CartPayment.Validate Total Price
    CartPayment.Log The Result

Choose Payment Method And Move To Confirmation
    CartPayment.Choose Payment Method
    CartConfirmation.Verify Load

Confirm Order
    CartConfirmation.Confirm Order
    CartConfirmation.Verify Confirmation Success
