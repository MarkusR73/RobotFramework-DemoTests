*** Settings ***
Library     SeleniumLibrary
Suite Setup         Open Browser And Go To URL
Suite Teardown      Close Browser
Library             RandomRegistration.py

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

${Sign_In_Button}                   xpath=/html/body/div/div[1]/header/div[2]/div/div/nav/div[1]/a
${Create_An_Account}                xpath=//*[@id="SubmitCreate"]/span
${Lock_Icon}                        xpath=//*[@id="SubmitLogin"]/span
${Sign_Out}                         xpath=//a[text()="Sign out"]
${Dresses_Link}                     xpath=//*[@id="block_top_menu"]/ul/li[2]/a
${CHOSEN_DRESS}                     xpath=//*[@id="center_column"]/ul/li[4]/div/div[2]/h5/a
${Color_Dress}                      xpath=//*[@id="color_8"]
${WOMEN_Link}                       xpath=//a[@title="Women"]
${Blouse_Link}                      xpath=//a[@class='product-name' and @title='Blouse']   
${Color_Blouse}                     xpath=//a[@id="color_8"]                        
${ADD_TO_CART_BUTTON}               xpath=//span[text()='Add to cart']
${CONTINUE_SHOPPING_BUTTON}         xpath=//span[text()[contains(., "Continue shopping")]] 
${HOME_ICON}                        xpath=//i[contains(@class, 'icon-home')]
${Product_Count}                    css=div.product-count
${Cart_Link}                        xpath=//b[text()='Cart']
${Summary_Text}                     xpath=//*[@id="cart_title"]
${Delete_Dress}                     xpath=//*[@id="6_40_0_0"]/i
${Checkout_Button}                  xpath=//*[@id="center_column"]/p[2]/a[1]/span

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
    Click Element   ${Sign_Out}

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
    Click Element   ${Sign_Out}

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


Add Dress To Cart
    Go To    ${URL}
    Maximize Browser Window

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
    
    #Close Browser

Add Blouse To Cart
    Go To    ${URL}
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

    #Close Browser

Remove from Cart
    Go To    ${URL}

    # Wait until the shopping cart icon is visible, then enter the cart
    Wait Until Element Is Visible   ${Cart_Link}
    Click Element   ${Cart_Link}

    # Wait until the "summary" text is visible, then remove the dress from the cart
    Wait Until Element Is Visible   ${Summary_Text}
    Click Or Scroll     ${Delete_Dress}
    
    # Wait until the dress is removed from the cart
    Wait Until Element Is Not Visible   xpath=//a[contains(@href, 'id_product=6')]

    #Close Browser

Verify Total Price
    # Wait for the total price element to be visible
    Wait Until Element Is Visible    id=total_price

    # Get the text inside the total price span
    ${total_price}=    Get Text    id=total_price

    # Verify the total price value
    Should Be Equal    ${total_price}    $34


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
    FOR    ${index}    IN RANGE    0    10
        Execute Javascript    window.scrollBy(0, 300)
        Sleep    0.5s
        ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
        Exit For Loop If    ${is_clickable}
    END