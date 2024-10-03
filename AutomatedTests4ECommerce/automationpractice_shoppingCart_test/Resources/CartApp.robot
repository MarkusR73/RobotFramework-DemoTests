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
User Information Should Be Generated
    Common.Generate User Information

Home Page Should Load
    Home.Open Page
    Home.Verify Load

Should Move To Sign In Page
    Home.Click Sign In Link
    SignIn.Verify Load

Should Move To Create Account Form
    SignIn.Input Email Address
    SignIn.Click Create Account Button
    CreateAccount.Verify Load

Should Fill Personal Info
    CreateAccount.Select Gender
    CreateAccount.Fill Name Information
    CreateAccount.Select Password
    CreateAccount.Select Date Of Birth

Should Complete Registration
    CreateAccount.Click Register
    MyAccount.Verify Registration

Should Sign Out
    MyAccount.Sign Out
    SignIn.Verify Load

Sign In Should Succeed
    SignIn.Fill Valid User Info
    SignIn.Sign In
    MyAccount.Verify Sign In

Sign In Should Fail
    SignIn.Fill Invalid User Info
    SignIn.Sign In
    SignIn.Verify Error Message

Should Move To Home Page
    MyAccount.Move To Home Page
    Home.Verify Load

Should Move To Dresses Page
    Home.Click Dresses Link
    ProductListing.Verify Dress Listing Load

Should Choose Dress
    ProductListing.Choose Dress
    Product.Verify Dress Page Load

Should Add Dress To Cart
    Product.Choose Color
    Product.Verify Availability
    Product.Add To Cart
    Product.Verify Successful Addition
    Product.Continue Shopping

Should Move To Women Page
    Home.Click Women Link
    ProductListing.Verify Blouse Listing Load

Should Choose Blouse
    ProductListing.Choose Blouse
    Product.Verify Blouse Page Load

Should Add Blouse To Cart
    Product.Choose Color
    Product.Verify Availability
    Product.Add To Cart
    Product.Verify Successful Addition
    Product.Continue Shopping

Should Move To Cart Page
    Home.Click Cart Link
    CartSummary.Verify Load

Should Remove Dress From Cart
    CartSummary.Remove Dress
    CartSummary.Verify Dress Disappearance

Total Price Should Equal
    CartSummary.Price Should Be Visible
    CartSummary.Verify Total Price

Should Move From Summary To Address Step
    CartSummary.Proceed Link Should Be Visible
    CartSummary.Click Proceed Link
    YourAddresses.Verify Load

Should Fill And Save Address Information
    YourAddresses.Fill Address Info
    YourAddresses.Save Address Info

Should Verify Billing Address And Move To Shipping
    CartAddress.Verify Load
    CartAddress.Verify Billing Address
    CartAddress.Move To Shipping

Should Check Terms Of Service And Move to Payment
    CartShipping.Verify Load
    CartShipping.Check Terms Box
    CartShipping.Move To Payment
    CartPayment.Verify Load

Should Verify Total Price
    CartPayment.Validate Total Price
    CartPayment.Log The Result

Should Choose Payment Method And Move To Confirmation
    CartPayment.Choose Payment Method
    CartConfirmation.Verify Load

Order Should Be Completed
    CartConfirmation.Confirm Order
    CartConfirmation.Verify Confirmation Success
