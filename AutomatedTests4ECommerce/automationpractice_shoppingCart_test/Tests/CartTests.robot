*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/CartApp.robot

Suite Setup         Common.Begin Web Test
Suite Teardown      Common.End Web Test

# Run the script:
# robot -d Results Tests/CartTests.robot

*** Test Cases ***
Registration
    User Information Should Be Generated
    Home Page Should Load
    Should Move To Sign In Page
    Should Move To Create Account Form
    Should Fill Personal Info
    Should Complete Registration
    Should Sign Out

*** Test Cases ***
Valid login
    Home Page Should Load
    Should Move To Sign In Page
    Sign In Should Succeed
    Should Sign Out

*** Test Cases ***
Invalid login
    Home Page Should Load
    Should Move To Sign In Page
    Sign In Should Fail

*** Test Cases ***
Add Dress To Cart
    Home Page Should Load
    Should Move To Sign In Page
    Sign In Should Succeed
    Should Move To Home Page
    Should Move To Dresses Page
    Should Choose Dress
    Should Add Dress To Cart
    Should Move To Home Page

Add Blouse To Cart
    Home Page Should Load
    Should Move To Women Page
    Should Choose Blouse
    Should Add Blouse To Cart
    Should Move To Home Page

Remove from Cart
    Home Page Should Load
    Should Move To Cart Page
    Should Remove Dress From Cart

Verify Total Price
    Total Price Should Equal

Proceed To Checkout
    Should Move From Summary To Address Step
    Should Fill And Save Address Information
    Should Verify Billing Address And Move To Shipping
    Should Check Terms Of Service And Move to Payment
    Should Verify Total Price
    Should Choose Payment Method And Move To Confirmation
    Order Should Be Completed