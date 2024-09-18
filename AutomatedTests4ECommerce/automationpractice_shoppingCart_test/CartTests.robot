*** Settings ***
Resource    CartResources.robot
Resource    CartKeywords.robot
Library     SeleniumLibrary
Suite Setup         Open Browser And Go To URL
Suite Teardown      Close Browser
Library             RandomRegistration.py

*** Test Cases ***
Generate user info
    # Generate a random email
    ${Random_Email}=    Generate Random Email
    Set Global Variable     ${Random_Email}

    # Generate firstname, lastname and password
    ${Firstname}=  Generate Random String
    Set Global Variable     ${Firstname}
    ${Lastname}=  Generate Random String
    Set Global Variable     ${Lastname}
    ${Password}=    Generate Random String
    Set Global Variable     ${Password}

*** Test Cases ***
Registration 
    Go To   ${URL}
    Maximize Browser Window

    # Wait until the sign-in button is visible and click it
    Wait Until Element Is Visible   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 

    # Wait until the "Create An Account" element appears on page
    Wait Until Page Contains Element   ${CREATE_AN_ACCOUNT_BUTTON}

    # Input email and click create account button
    Input Text  ${CREATE_EMAIL_FIELD}   ${Random_Email}
    Click Button   ${CREATE_AN_ACCOUNT_BUTTON}

    # Wait until personal information form is visible
    Wait Until Page Contains Element   ${REGISTRATION_FORM_HEADER}

    # Select gender
    Click Element   ${GENDER_SELECTOR_MR}
    
    # Verify that 'MR' is selected
    ${Gender_Selector_Value}=    Get Element Attribute    ${GENDER_SELECTOR_MR}     checked
    Should Be Equal As Strings    ${Gender_Selector_Value}    true

    # Input user info into the form
    Input Text  ${FIRSTNAME_FIELD}      ${Firstname}
    Input Text  ${LASTNAME_FIELD}       ${Lastname}
    Input Text  ${PASSWORD_FIELD}       ${Password}

    # Select date of birth
    Select From List By Value    ${BIRTHDAY_SELECTOR}       ${BIRTHDAY}
    Select From List By Value    ${BIRTH_MONTH_SELECTOR}    ${BIRTH_MONTH}
    Select From List By Value    ${BIRTH_YEAR_SELECTOR}     ${BIRTH_YEAR}
    
    # Verify the selected values
    ${selected_value}=              Get Selected List Value     ${BIRTHDAY_SELECTOR}
    Should Be Equal As Strings      ${selected_value}           ${BIRTHDAY}
    ${selected_value}=              Get Selected List Value     ${BIRTH_MONTH_SELECTOR}
    Should Be Equal As Strings      ${selected_value}           ${BIRTH_MONTH}
    ${selected_value}=              Get Selected List Value     ${BIRTH_YEAR_SELECTOR}
    Should Be Equal As Strings      ${selected_value}           ${BIRTH_YEAR}

    # Complete registration
    Click Button   ${REGISTER_BUTTON}

    # Wait until the success message is visible
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE}

    # Sign out
    Click Element   ${SIGN_OUT_LINK}

    # Wait until sign out process fully executed
    Wait Until Element Is Visible   ${CREATE_AN_ACCOUNT_BUTTON}

    close browser

*** Test Cases ***
Valid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${LOCK_ICON}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   ${Password}
    Click Element   ${LOCK_ICON}

    # Wait until "my account" header is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/h1

    #Sign out
    Click Element   ${SIGN_OUT_LINK}

    # Wait until sign out process Complete
    Wait Until Element Is Visible   ${CREATE_AN_ACCOUNT_BUTTON}

    close browser

*** Test Cases ***
Invalid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${LOCK_ICON}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   wrongpasswd
    Click Element   ${LOCK_ICON}

    # Wait until error message is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/div[1]/p

    close browser

*** Test Cases ***
Add Dress To Cart
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${SIGN_IN_LINK} 
    Click Element   ${SIGN_IN_LINK} 
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${LOCK_ICON}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   ${Password}
    Click Element   ${LOCK_ICON}

    # Wait until "my account" header is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/h1
    Click Element   ${HOME_ICON}

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${DRESSES_LINK}
    Click Element   ${DRESSES_LINK}

    Wait Until Page Contains Element   ${PRODUCT_LIST_COUNT}
    Click or Scroll    ${CHOSEN_DRESS}
    
    Wait Until Element Is Visible   ${COLOR_WHITE}
    # Select color currently in stock
    Click Element   ${COLOR_WHITE}

    Wait Until Page Contains Element   ${ADD_TO_CART_ELEMENT}
    Click Element   ${ADD_TO_CART_ELEMENT}

    Wait Until Page Contains Element    ${CONTINUE_SHOPPING_LINK}
    Click Element   ${CONTINUE_SHOPPING_LINK}
    
    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Add Blouse To Cart
    Wait Until Element Is Visible   ${WOMEN_LINK}
    Click Element   ${WOMEN_LINK}

    Wait Until Element Is Visible   ${PRODUCT_LIST_COUNT}
    Click or Scroll    ${BLOUSE_LINK}

    
    Wait Until Element Is Visible   ${COLOR_WHITE}
    # Select color currently in stock
    Click Element   ${COLOR_WHITE}
    
    Wait Until Page Contains Element   ${ADD_TO_CART_ELEMENT}
    Click Element   ${ADD_TO_CART_ELEMENT}
    
    Wait Until Element Is Visible   ${CONTINUE_SHOPPING_LINK}
    Click Element   ${CONTINUE_SHOPPING_LINK}

    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Remove from Cart
    # Wait until the shopping cart icon is visible, then enter the cart
    Wait Until Element Is Visible   ${CART_LINK} 
    Click Element   ${CART_LINK} 

    # Wait until the page is fully loaded, then remove the dress from the cart
    Wait Until Element Is Visible   ${Summary_Text}
    Wait Until Element Is Visible   ${DELETE_ICON_DRESS}
    Click Or Scroll     ${DELETE_ICON_DRESS}
    
    # Wait until the dress is removed from the cart and verify
    Wait Until Element Is Not Visible   xpath=//a[contains(@href, 'id_product=6')]
    Wait Until Expected Value Is Visible    1 product   ${PRODUCT_COUNT_ELEMENT}

Verify Total Price
    # Wait for the total price element to be visible
    Wait Until Element Is Visible    id=total_price

    # Get the text inside the total price span
    ${total_price}=    Get Text    id=total_price

    # Verify the total price value
    Should Be Equal    ${total_price}    $34

Proceed To Checkout
    # Wait for the checkout link to be visible and click it to proceed 
    Wait Until Element Is Visible   ${CHECKOUT_LINK}
    Click Element   ${CHECKOUT_LINK}

    # Wait for the address info header to appear before filling out the address form
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/div/h1
    ${Address}=     Generate Random String
    Input Text      id=address1     ${Address}
    ${City}=     Generate Random String
    Input Text      id=city     ${City}
    Select From List By Value   id=id_state     1
    Input Text      id=postcode     90500
    Select From List By Value   id=id_country   21
    Input Text      id=phone    +358 50 666 5555
    Click Element   xpath=//*[@id="submitAddress"]/span

    # Wait until the address delivery section is visible and click the "Proceed" button
    Wait Until Element Is Visible   xpath=//*[@id="address_delivery"]/li[7]/a/span
    Click Or Scroll     xpath=//*[@id="center_column"]/form/p/button/span

    # Wait for the terms and conditions checkbox to be visible and click it
    Wait Until Page Contains Element   id=cgv
    Click Element   id=cgv

    # Verify that the terms and conditions checkbox is selected
    ${checked}=    Get Element Attribute    id=cgv    checked
    Should Be Equal As Strings    ${checked}    true

    # Click the button to proceed to the next step
    Click Element   name=processCarrier

    # Validate total price and log the result
    ${total_price}=    Get Text    id=total_price
    Run Keyword And Continue On Failure    Should Be Equal    ${total_price}    $34
    Log    Total price is: ${total_price}

    # Click the "Pay by check" option to proceed with payment
    Click Element    xpath=//a[@title='Pay by check.']

    # Wait for the "Confirm my order" button to be visible and click it
    Wait Until Page Contains Element   xpath=//button[@type='submit' and contains(span, 'I confirm my order')]
    Click Element    xpath=//button[@type='submit' and contains(span, 'I confirm my order')]

    # Verify that the order confirmation message is displayed
    Wait Until Element Is Visible   xpath=//p[@class='alert alert-success']
    Element Text Should Be    xpath=//p[@class='alert alert-success']    Your order on My Shop is complete.