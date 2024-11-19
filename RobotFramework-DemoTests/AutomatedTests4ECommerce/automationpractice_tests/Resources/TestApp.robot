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
Begin Account Creation
    NavBar.Navigate To                                      ${SIGN_IN_LINK}
    SignIn.Verify Page Loaded
    SignIn.Fill Create An Account "Email address" Filed     ${USER_INFORMATION.EMAIL}
    SignIn.Click "Create an account" Button
    CreateAccount.Verify Page Loaded

Fill In User Information
    CreateAccount.Select "Title"                ${Title_MR}
    CreateAccount.Fill "First name" Field       ${USER_INFORMATION.FIRSTNAME}
    CreateAccount.Fill "Last name" Field        ${USER_INFORMATION.LASTNAME}
    CreateAccount.Fill "Password" Field         ${USER_INFORMATION.PASSWORD}
    CreateAccount.Select "Date Of Birth"        ${USER_INFORMATION.BIRTHDAY}        ${USER_INFORMATION.BIRTH_MONTH}     ${USER_INFORMATION.BIRTH_YEAR}

Submit User Information Form
    CreateAccount.Click "Register" Button
    MyAccount.Success Message Should Be Visible

Sign Out
    NavBar.Navigate To   ${SIGN_OUT_LINK}
    SignIn.Verify Page Loaded

Sign In With Valid Credentials
    NavBar.Navigate To              ${SIGN_IN_LINK}
    SignIn.Verify Page Loaded
    SignIn.Try To Sign In           ${USER_INFORMATION.EMAIL}   ${USER_INFORMATION.PASSWORD}
    MyAccount.Verify Sign In

Sign In With Invalid Credentials
    NavBar.Navigate To              ${SIGN_IN_LINK}
    SignIn.Verify Page Loaded
    SignIn.Try To Sign In           ${USER_INFORMATION.EMAIL}   ${WRONG_PASSWORD}
    SignIn.Verify Error Message

Search For Product
    [Arguments]                     ${search_term}
    NavBar.Input Search Term        ${SEARCH_TERM}
    NavBar.Navigate To       ${SEARCH_BUTTON}

Verify Search Results
    ProductListing.Verify Page Loaded   ${RESULT_COUNT_ELEMENT}
    ProductListing.Verify Result Count  ${EXPECTED_RESULT_COUNT}

Move To Product Listing
    [Arguments]     ${bar_element}  ${landing_page_element}
    NavBar.Navigate To           ${bar_element}
    ProductListing.Verify Page Loaded   ${landing_page_element}

Choose Product From Listing
    [Arguments]     ${product}  ${landing_page_element}
    ProductListing.Choose Product   ${product}
    Product.Verify Page Loaded      ${landing_page_element}

Add Product To Cart
    Product.Choose Color            ${COLOR_BOX_WHITE}
    Product.Verify Availability
    Product.Click "Add to cart" Button
    Product.Window With Success Message should Appear
    Product.Click "Continue Shopping" Element

View My Shopping Cart
    NavBar.Navigate To   ${CART_LINK}
    CartSummary.Verify Page Loaded

Remove Product From Cart
    [Arguments]     ${delete_icon}
    CartSummary.Remove Product      ${delete_icon}

Begin Checkout Process
    CartSummary.Click "Proceed to checkout" Link
    YourAddresses.Verify Page Loaded

Fill Address Information
    YourAddresses.Fill Address Info
    YourAddresses.Save Address Info

Verify Billing Address
    CartAddress.Verify Page Loaded
    CartAddress.Verify Billing Address

Move To Shipping Step
    CartAddress.Move To Shipping
    CartShipping.Verify Page Loaded

Check Terms Of Service
    CartShipping.Check Terms Box

Move To Payment Step
    CartShipping.Move To Payment
    CartPayment.Verify Page Loaded

Verify Total Price
    CartPayment.Compare Locator Value To Expected Value    ${TOTAL_PRICE_LOCATOR}      ${EXPECTED_TOTAL_PRICE}

Choose Payment Method
    CartPayment.Choose Payment Method               ${PAY_BY_CHECK_LINK}
    CartConfirmation.Verify Page Loaded

Confirm Order
    CartConfirmation.Confirm Order
    CartConfirmation.Verify Confirmation Success
