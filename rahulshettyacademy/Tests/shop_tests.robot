*** Settings ***
Resource        ../Resources/testApp.robot
Resource        ../Resources/common.robot

Test Setup      common.Begin web test
Test Teardown   common.End web test

# Run tests:
# robot -d Results Tests/shop_tests.robot

*** Variables ***
@{ALL_PRODUCT_NAMES}=       iphone X     Samsung Note 8      Nokia Edge      Blackberry
@{SELECTED_PRODUCTS}=       Samsung Note 8      Blackberry

*** Test Cases ***
All expected products should be visible on the shop page
    [Tags]  0004    shop_page   smoke
    testApp.Move to shop page
    testApp.Verify product titles   ${ALL_PRODUCT_NAMES}

Products should be added to the cart successfully
    [Tags]  0005    cart    smoke
    testApp.Move to shop page
    testApp.Select products by title    ${SELECTED_PRODUCTS}
    testApp.Check cart products         ${SELECTED_PRODUCTS}