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
Resource    PO/NavBar.robot
Resource    PO/Home.robot
Resource    PO/SignIn.robot
Resource    Common.robot

*** Keywords ***
Go To Sign In Page
    NavBar.Click Sign In Link
    SignIn.Verify Load

Create New Account
    SignIn.Begin Account Creation
    CreateAccount.Verify Load
    CreateAccount.Fill User Information
    CreateAccount.Click Register
    MyAccount.Verify Registration

Valid Sign In
    Go To Sign In Page
    SignIn.Try To Sign In   ${USER_INFORMATION.EMAIL}   ${USER_INFORMATION.PASSWORD}
    MyAccount.Verify Sign In

Invalid Sign In
    Go To Sign In Page
    SignIn.Try To Sign In   ${USER_INFORMATION.EMAIL}   ${WRONG_PASSWORD}
    SignIn.Verify Error Message

Sign Out
    MyAccount.Sign Out
    SignIn.Verify Load

Execute Search
    NavBar.Input Search Term      ${SEARCH_TERM}
    NavBar.Execute Search

Verify Search Results
    ProductListing.Verify Search Listing Load
    ProductListing.Verify Result Count

Move To Dress Listing
    Move To Product Listing     ${DRESSES_LINK}     ${DRESSES_HEADER}

Choose Dress
    Move To Product Page        ${CHOSEN_DRESS}     ${PRODUCT_REFERENCE_DRESS}

Move To Women Listing
    Move To Product Listing     ${WOMEN_LINK}     ${WOMEN_HEADER}

Choose Blouse
    Move To Product Page        ${CHOSEN_BLOUSE}    ${PRODUCT_REFERENCE_BLOUSE}

Move To Product Listing
    [Arguments]     ${bar_element}  ${landing_page_element}
    NavBar.Click Bar Element        ${bar_element}
    ProductListing.Verify Load      ${landing_page_element}

Move To Product Page
    [Arguments]     ${product}  ${landing_page_element}
    ProductListing.Choose Product   ${product}
    Product.Verify Load             ${landing_page_element}

Add Product To Cart
    Product.Choose Color
    Product.Verify Availability
    Product.Add To Cart
    Product.Verify Successful Addition
    Product.Continue Shopping

Go To Cart Page
    NavBar.Click Cart Link
    CartSummary.Verify Load

Remove Dress From Cart
    CartSummary.Remove Product        ${DELETE_ICON_DRESS}     ${DRESS_LOCATOR}

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
