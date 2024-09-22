*** Settings ***
Resource    ../Resources/CartResources.robot
Resource    ../Resources/CartKeywords.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/Cart.robot
Library     SeleniumLibrary
Suite Setup    Common.Begin Web Test
Suite Teardown    End Web Test

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

    # Call sign in keyword
    Try To Sign In  ${USER_INFORMATION.EMAIL}   ${USER_INFORMATION.PASSWORD}

    # Wait until "my account" header is visible
    Wait Until Page Contains Element   ${MY_ACCOUNT_HEADER}
    Click Element   ${HOME_ICON}

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${DRESSES_LINK}
    Click Element   ${DRESSES_LINK}

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${PRODUCT_LIST_COUNT}
    Click or Scroll    ${CHOSEN_DRESS}
    
    # Wait until page fully loaded
    Wait Until Page Contains Element   ${COLOR_WHITE}
    # Select color currently in stock
    Click Element   ${COLOR_WHITE}

    # Wait until the page reacts to the color choice and "Add to Cart"-element becomes interactable
    Wait Until Element Is Visible   ${ADD_TO_CART_ELEMENT}
    Wait Until Element Is Enabled   ${ADD_TO_CART_ELEMENT}
    Click Element   ${ADD_TO_CART_ELEMENT}

    # Wait until the popup-window elements are interactable
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE_PRODUCT_ADDED}
    Wait Until Element Is Enabled   ${CONTINUE_SHOPPING_LINK}
    Click Element   ${CONTINUE_SHOPPING_LINK}
    
    # Wait until the popup-window is closed and home icon becomes visible
    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Add Blouse To Cart
    # Wait until page fully loaded
    Wait Until Page Contains Element   ${WOMEN_LINK}
    Click Element   ${WOMEN_LINK}

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${PRODUCT_LIST_COUNT}
    Click or Scroll    ${BLOUSE_LINK}

    
    # Wait until page fully loaded
    Wait Until Page Contains Element   ${COLOR_WHITE}
    # Select color currently in stock
    Click Element   ${COLOR_WHITE}

    # Wait until the page reacts to the color choice and "Add to Cart"-element becomes interactable
    Wait Until Element Is Visible   ${ADD_TO_CART_ELEMENT}
    Wait Until Element Is Enabled   ${ADD_TO_CART_ELEMENT}
    Click Element   ${ADD_TO_CART_ELEMENT}
    
    # Wait until the popup-window elements are interactable
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE_PRODUCT_ADDED}
    Wait Until Element Is Enabled   ${CONTINUE_SHOPPING_LINK}
    Click Element   ${CONTINUE_SHOPPING_LINK}

    # Wait until the popup-window is closed and home icon becomes visible
    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Remove from Cart
    # Wait until the shopping cart icon is visible, then enter the cart
    Wait Until Page Contains Element   ${CART_LINK} 
    Click Element   ${CART_LINK} 

    # Wait until the page is fully loaded, then remove the dress from the cart
    Wait Until Page Contains Element   ${SUMMARY_TEXT}
    Wait Until Element Is Enabled   ${DELETE_ICON_DRESS}
    Click Or Scroll     ${DELETE_ICON_DRESS}
    
    # Wait until the dress is removed from the cart and verify
    Wait Until Element Is Not Visible   ${DRESS_LOCATOR}
    Wait Until Expected Value Is Visible    ${EXPECTED_COUNT}   ${PRODUCT_COUNT_ELEMENT}

Verify Total Price
    # Wait for the total price element to be visible
    Wait Until Element Is Visible   ${TOTAL_PRICE}

    # Get the text inside the total price span
    ${total_price_value}=    Get Text    ${TOTAL_PRICE}

    # Verify the total price value
    Should Be Equal    ${total_price_value}    $34

Proceed To Checkout
    # Wait for the checkout link to be visible and click it to proceed 
    Wait Until Element Is Visible   ${CHECKOUT_LINK}
    Click Element   ${CHECKOUT_LINK}

    # Wait for the address info header to appear before filling out the address form
    Wait Until Page Contains Element   ${YOUR_ADDRESSES_HEADER} 
    Input Text                          ${ADDRESS_FIELD}            ${USER_INFORMATION.ADDRESS}
    Input Text                          ${CITY_FIELD}               ${USER_INFORMATION.CITY}
    Select From List By Value           ${STATE_LIST}               ${USER_INFORMATION.STATE}
    Input Text                          ${POSTCODE_FIELD}           ${USER_INFORMATION.POSTCODE}
    Select From List By Value           ${COUNTRY_LIST}             ${USER_INFORMATION.COUNTRY}
    Input Text                          ${HOME_PHONE_FIELD}         ${USER_INFORMATION.PHONE_NUM}
    Click Button   ${SAVE_BUTTON}

    # Wait until the address delivery section is visible, 
    Wait Until Page Contains Element    ${CHECKBOX_DELIVERY_ADDRESS}

    # Verify that the "Use delivery address as the billing address"-box is checked and click the "Proceed"-button
    ${Checkbox1_value}=             Get Element Attribute       ${CHECKBOX_DELIVERY_ADDRESS}    class
    Should Be Equal As Strings      ${Checkbox1_value}          checked
    Click Or Scroll                 ${PROCEED_TO_CHECKOUT_BUTTON}

    # Wait for the terms and conditions checkbox to be visible and click it
    Wait Until Page Contains Element    ${AGREE_TERMS_CHECKBOX}
    Click Element   ${AGREE_TERMS_CHECKBOX}

    # Click the button to proceed 
    Click Element   ${PROCEED_TO_CHECKOUT_BUTTON}

    # Validate total price and log the result
    ${total_price}=                         Get Text            ${TOTAL_PRICE}
    Run Keyword And Continue On Failure     Should Be Equal     ${total_price}    $34
    Log    Total price is: ${total_price}

    # Click the "Pay by check" option to proceed with payment
    Click Element    ${PAY_BY_CHECK_ELEMENT} 

    # Wait for the "Confirm my order" button to be visible and click it
    Wait Until Page Contains Element    ${CONFIRM_MY_ORDER_BUTTON}
    Click Element   ${CONFIRM_MY_ORDER_BUTTON}

    # Verify that the order confirmation message is displayed
    Wait Until Page Contains Element    ${ORDER_COMPLETE_MESSAGE}
    Element Text Should Be      ${ORDER_COMPLETE_MESSAGE}       Your order on My Shop is complete.