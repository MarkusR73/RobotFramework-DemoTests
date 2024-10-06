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
    NavBar.Click Bar Element                    ${SIGN_IN_LINK}
    SignIn.Verify Page Loaded

Begin Account Creation
    SignIn.Input Email Address                  ${USER_INFORMATION.EMAIL}
    SignIn.Click Create Account Button
    CreateAccount.Verify Page Loaded

Fill In User Information
    CreateAccount.Select Gender                 ${GENDER_MR_CHECKBOX}
    CreateAccount.Input Name Information        ${USER_INFORMATION.FIRSTNAME}       ${USER_INFORMATION.LASTNAME}
    CreateAccount.Input Password                ${USER_INFORMATION.PASSWORD}
    CreateAccount.Select Date Of Birth          ${USER_INFORMATION.BIRTHDAY}        ${USER_INFORMATION.BIRTH_MONTH}     ${USER_INFORMATION.BIRTH_YEAR}

Submit User Information Form
    CreateAccount.Submit Account Information
    MyAccount.Verify Success Of Account Creation

Sign Out
    MyAccount.Sign Out
    SignIn.Verify Page Loaded

Sign In With Valid Credentials
    Go To Sign In Page
    SignIn.Try To Sign In   ${USER_INFORMATION.EMAIL}   ${USER_INFORMATION.PASSWORD}
    MyAccount.Verify Sign In

Sign In With Invalid Credentials
    Go To Sign In Page
    SignIn.Try To Sign In   ${USER_INFORMATION.EMAIL}   ${WRONG_PASSWORD}
    SignIn.Verify Error Message

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
