*** Settings ***
Resource    CartResources.robot
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
    ${First_Name}=  Generate Random String
    Set Global Variable     ${First_Name}
    ${Last_Name}=  Generate Random String
    Set Global Variable     ${Last_Name}
    ${Password}=    Generate Random String
    Set Global Variable     ${Password}

*** Test Cases ***
Registration 
    Go To   ${URL}
    Maximize Browser Window

    # Wait until the sign-in button is visible and click it
    Wait Until Element Is Visible   ${Sign_In_Button}
    Click Element   ${Sign_In_Button}

    # Wait until the "Create An Account" element is visible
    Wait Until Element Is Visible   ${Create_An_Account}

    # Input email and click crate account button
    Input Text  xpath=//*[@id="email_create"]   ${Random_Email}
    Click Element   ${Create_An_Account}

    # Wait until personal information form is visible
    Wait Until Element Is Visible   xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[1]/h3

    # Select gender
    Click Element   id=id_gender1
    
    # Verify that the gender button is selected
    ${checked}=    Get Element Attribute    id=id_gender1    checked
    Should Be Equal As Strings    ${checked}    true

    # Input user info into the form
    Input Text  id=customer_firstname   ${First_Name}
    Input Text  id=customer_lastname    ${Last_Name}
    Input Text  id=passwd    ${Password}

    # Select date of birth
    Select From List By Value    id=days    1
    Select From List By Value    id=months    1
    Select From List By Value    id=years    2000
    
    # Verify the selected values
    ${selected_value}=    Get Selected List Value    id=days
    Should Be Equal As Strings    ${selected_value}    1
    ${selected_value}=    Get Selected List Value    id=months
    Should Be Equal As Strings    ${selected_value}    1
    ${selected_value}=    Get Selected List Value    id=years
    Should Be Equal As Strings    ${selected_value}    2000

    # Complete registration by clicking the submit button
    Click Element   id=submitAccount

    # Wait until the success message is visible
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[1]

    # Sign out
    Click Element   ${Sign_Out_Button}

    # Wait until sign out process fully executed
    Wait Until Element Is Visible   ${Create_An_Account}

    close browser

*** Test Cases ***
Valid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${Sign_In_Button}
    Click Element   ${Sign_In_Button}
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${Lock_Icon}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   ${Password}
    Click Element   ${Lock_Icon}

    # Wait until "my account" header is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/h1

    #Sign out
    Click Element   ${Sign_Out_Button}

    # Wait until sign out process Complete
    Wait Until Element Is Visible   ${Create_An_Account}

    close browser

*** Test Cases ***
Invalid login
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${Sign_In_Button}
    Click Element   ${Sign_In_Button}
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${Lock_Icon}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   wrongpasswd
    Click Element   ${Lock_Icon}

    # Wait until error message is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/div[1]/p

    close browser

*** Test Cases ***
Add Dress To Cart
    Open Browser And Go To URL
    Maximize Browser Window

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${Sign_In_Button}
    Click Element   ${Sign_In_Button}
    
    # wait until lock button is visible, fill login infos and login
    Wait Until Element Is Visible   ${Lock_Icon}
    Input Text  id=email    ${Random_Email}
    Input Text  id=passwd   ${Password}
    Click Element   ${Lock_Icon}

    # Wait until "my account" header is visible
    Wait Until element Is Visible   xpath=//*[@id="center_column"]/h1
    Click Element   ${HOME_ICON}

    # Wait until page fully loaded
    Wait Until Element Is Visible   ${Dresses_Link}
    Click Element   ${Dresses_Link}

    Wait Until Element Is Visible   ${Product_Count}
    Click or Scroll    ${CHOSEN_DRESS}
    
    Wait Until Element Is Visible   ${Color_Dress}
    # Select color currently in stock
    Click Element   ${Color_Dress}

    Wait Until Element Is Visible   ${ADD_TO_CART_BUTTON}
    Click Element   ${ADD_TO_CART_BUTTON}
    
    Wait Until Element Is Visible   ${CONTINUE_SHOPPING_BUTTON}
    Click Element   ${CONTINUE_SHOPPING_BUTTON}
    
    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Add Blouse To Cart
    Wait Until Element Is Visible   ${WOMEN_Link}
    Click Element   ${WOMEN_Link}

    Wait Until Element Is Visible   ${Product_Count}
    Click or Scroll    ${BLOUSE_Link}

    
    Wait Until Element Is Visible   ${Color_Blouse}
    # Select color currently in stock
    Click Element   ${Color_Blouse}
    
    Wait Until Element Is Visible   ${ADD_TO_CART_BUTTON}
    Click Element   ${ADD_TO_CART_BUTTON}
    
    Wait Until Element Is Visible   ${CONTINUE_SHOPPING_BUTTON}
    Click Element   ${CONTINUE_SHOPPING_BUTTON}

    Wait Until Element Is Visible   ${HOME_ICON}
    Click Element   ${HOME_ICON}

Remove from Cart
    # Wait until the shopping cart icon is visible, then enter the cart
    Wait Until Element Is Visible   ${Cart_Link}
    Click Element   ${Cart_Link}

    # Wait until the page is fully loaded, then remove the dress from the cart
    Wait Until Element Is Visible   ${Summary_Text}
    Wait Until Element Is Visible   ${Delete_Dress}
    Click Or Scroll     ${Delete_Dress}
    
    # Wait until the dress is removed from the cart and verify
    Wait Until Element Is Not Visible   xpath=//a[contains(@href, 'id_product=6')]
    Wait Until Expected Value Is Visible    1 product   id=summary_products_quantity

Verify Total Price
    # Wait for the total price element to be visible
    Wait Until Element Is Visible    id=total_price

    # Get the text inside the total price span
    ${total_price}=    Get Text    id=total_price

    # Verify the total price value
    Should Be Equal    ${total_price}    $34

Proceed To Checkout
    # Wait for the checkout button to be visible and click it to proceed 
    Wait Until Element Is Visible   ${Checkout_Button}
    Click Element   ${Checkout_Button}

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

*** Keywords ***
Open Browser And Go To URL
    Open Browser    ${URL}    ${BROWSER}

# Try to click the desired element. If not clickable, scroll and try again
Click Or Scroll
    [Arguments]    ${locator}
    ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
    # Only if the initial click attempt fails, start scrolling and retrying
    Run Keyword If    not ${is_clickable}    Scroll And Click Element    ${locator}

#Scroll down and try to click desired element
Scroll And Click Element
    [Arguments]    ${locator}
    # Try up to 10 times to scroll and click the desired element
    FOR    ${index}    IN RANGE    0    10
        # Scroll down by 300 pixels
        Execute Javascript    window.scrollBy(0, 300)
        Sleep    0.5s
        # Attempt to click the element and capture the status
        ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
        # Exit the loop if the click was successful
        Exit For Loop If    ${is_clickable}
    END
    # Fail the test if the element was not clicked successfully
    Run Keyword If    not ${is_clickable}    Fail    Unable to click element with locator '${locator}' after scrolling.

Wait Until Expected Value Is Visible
    [Arguments]  ${expected_value}  ${locator}
    # Retry up to 10 times with a 1-second interval
    FOR  ${index}  IN RANGE  0  10
        # Retrieve the current value from the element
        ${current_value}=  Get Text   ${locator}
        # Check if the current value matches the expected value
        Run Keyword If  '${current_value}' == '${expected_value}'  Exit For Loop
        Sleep  1s
    END
    # Fail the test if the value is not updated
    Should Be True    '${current_value}' == '${expected_value}'    Expected value '${expected_value}' not found for locator '${locator}'