*** Settings ***
Resource    PO/CartPage.robot
Resource    PO/BlouseProductPage.robot
Resource    PO/WomenPage.robot
Resource    PO/ProductAdditionSuccessWindow.robot
Resource    PO/DressProductPage.robot
Resource    Po/DressesPage.robot
Resource    PO/MyAccountPage.robot
Resource    PO/CreateAccountPage.robot
Resource    PO/HomePage.robot
Resource    PO/SignInPage.robot
Resource    CartKeywords.robot

*** Keywords ***
User Information Should Be Generated
    CartKeywords.Generate User Information

Home Page Should Load
    HomePage.Open Page
    HomePage.Verify Load

Should Move To Sign In Page
    HomePage.Click Sign In Link
    SignInPage.Verify Load

Should Move To Create Account Form
    SignInPage.Input Email Address
    SignInPage.Click Create Account Button
    CreateAccountPage.Verify Load

Should Fill Personal Info
    CreateAccountPage.Select Gender
    CreateAccountPage.Fill Name Information
    CreateAccountPage.Select Password
    CreateAccountPage.Select Date Of Birth

Should Complete Registration
    CreateAccountPage.Click Register
    MyAccountPage.Verify Registration

Should Sign Out
    MyAccountPage.Sign Out
    SignInPage.Verify Load

Sign In Should Succeed
    SignInPage.Fill Valid User Info
    SignInPage.Sign In
    MyAccountPage.Verify Sign In

Sign In Should Fail
    SignInPage.Fill Invalid User Info
    SignInPage.Sign In
    SignInPage.Verify Error Message

Should Move To Home Page
    MyAccountPage.Move To Home Page
    HomePage.Verify Load

Should Move To Dresses Page
    HomePage.Click Dresses Link
    DressesPage.Verify Load

Should Choose Dress
    DressesPage.Choose Dress
    DressProductPage.Verify Load

Should Add Dress To Cart
    DressProductPage.Choose Color
    DressProductPage.Verify Availability
    DressProductPage.Add To Cart
    ProductAdditionSuccessWindow.Verify Appearance
    ProductAdditionSuccessWindow.Continue Shopping

Should Move To Women Page
    HomePage.Click Women Link
    WomenPage.Verify Load

Should Choose Blouse
    WomenPage.Choose Blouse
    BlouseProductPage.Verify Load

Should Add Blouse To Cart
    BlouseProductPage.Choose Color
    BlouseProductPage.Verify Availability
    BlouseProductPage.Add To Cart
    ProductAdditionSuccessWindow.Verify Appearance
    ProductAdditionSuccessWindow.Continue Shopping

Should Move To Cart Page
    HomePage.Click Cart Link
    CartPage.Verify Load

Should Remove Dress From Cart
    CartPage.Remove Dress
    CartPage.Verify Dress Disappearance

Total Price Should Equal
    CartPage.Price Should Be Visible
    CartPage.Verify Total Price


