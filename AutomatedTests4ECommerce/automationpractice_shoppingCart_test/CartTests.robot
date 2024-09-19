*** Settings ***
Resource    CartResources.robot
Resource    CartKeywords.robot
Library     SeleniumLibrary
Suite Setup         Open Browser And Go To URL
Suite Teardown      Close Browser
Library             RandomRegistration.py

*** Test Cases ***
Registration
    Generate User Information
    Go To   ${URL}
    Maximize Browser Window

    # Wait until the sign-in button is visible and click it
    Wait Until Page Contains Element   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 

    # Wait until the "Create An Account" element appears on page
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

    # Input email and click create account button
    Input Text  ${CREATE_EMAIL_FIELD}   ${USER_INFORMATION.EMAIL}
    Click Button   ${CREATE_AN_ACCOUNT_BUTTON}

    # Wait until personal information form is visible
    Wait Until Page Contains Element   ${REGISTRATION_FORM_HEADER}

    # Select gender
    Click Element   ${GENDER_SELECTOR_MR}
    
    # Verify that 'MR' is selected
    ${Gender_Selector_Value}=    Get Element Attribute    ${GENDER_SELECTOR_MR}     checked
    Should Be Equal As Strings    ${Gender_Selector_Value}    true

    # Input user info into the form
    Input Text  ${FIRSTNAME_FIELD}      ${USER_INFORMATION.FIRSTNAME}
    Input Text  ${LASTNAME_FIELD}       ${USER_INFORMATION.LASTNAME}
    Input Text  ${PASSWORD_FIELD}       ${USER_INFORMATION.PASSWORD}

    # Select date of birth
    Select From List By Value    ${BIRTHDAY_SELECTOR}       ${USER_INFORMATION.BIRTHDAY}
    Select From List By Value    ${BIRTH_MONTH_SELECTOR}    ${USER_INFORMATION.BIRTH_MONTH}
    Select From List By Value    ${BIRTH_YEAR_SELECTOR}     ${USER_INFORMATION.BIRTH_YEAR}

    # Complete registration
    Click Button   ${REGISTER_BUTTON}

    # Wait until the success message is visible
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE_REGISTRATION}

    # Sign out
    Click Element   ${SIGN_OUT_LINK}

    # Wait until sign out process fully executed
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

    close browser

*** Test Cases ***
Valid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Page Contains Element   ${LOCK_ICON}
    Input Text  ${LOGIN_EMAIL_FIELD}    ${USER_INFORMATION.EMAIL}
    Input Text  ${LOGIN_PASSWORD_FIELD}   ${USER_INFORMATION.PASSWORD}
    Click Element   ${LOCK_ICON}

    # Wait until "my account" header is visible
    Wait Until Element Is Visible   ${MY_ACCOUNT_HEADER}

    #Sign out
    Click Element   ${SIGN_OUT_LINK}

    # Wait until sign out process Complete
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

    close browser

*** Test Cases ***
Invalid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Page Contains Element   ${LOCK_ICON}
    Input Text  ${LOGIN_EMAIL_FIELD}    ${USER_INFORMATION.EMAIL}
    Input Text  ${LOGIN_PASSWORD_FIELD}   ${WRONG_PASSWORD}
    Click Element   ${LOCK_ICON}

    # Wait until error message is visible
    Wait Until Element Is Visible   ${INVALID_PASSWORD_ERROR}

    close browser

*** Test Cases ***
Add Dress To Cart
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Page Contains Element   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Page Contains Element   ${LOCK_ICON}
    Input Text  ${LOGIN_EMAIL_FIELD}    ${USER_INFORMATION.EMAIL}
    Input Text  ${LOGIN_PASSWORD_FIELD}   ${USER_INFORMATION.PASSWORD}
    Click Element   ${LOCK_ICON}

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
    Wait Until Expected Value Is Visible    1 product   ${PRODUCT_COUNT_ELEMENT}

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

    # Click the button to proceed to the next step
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

    Close Browser