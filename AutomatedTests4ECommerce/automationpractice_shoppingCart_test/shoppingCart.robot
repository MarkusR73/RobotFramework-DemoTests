*** Settings ***
Library     SeleniumLibrary
Suite Setup    Open Browser And Go To URL
Suite Teardown    Close Browser

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

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

*** Test Cases ***
Add Dress To Cart
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

    Close Browser



*** Keywords ***
Open Browser And Go To URL
    Open Browser    ${URL}    ${BROWSER}

Click Or Scroll
    [Arguments]    ${locator}
    ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
    # Only if the initial click attempt fails, start scrolling and retrying
    Run Keyword If    not ${is_clickable}    Scroll And Click Element    ${locator}

Scroll And Click Element
    [Arguments]    ${locator}
    FOR    ${index}    IN RANGE    0    10
        Execute Javascript    window.scrollBy(0, 300)
        Sleep    0.5s
        ${is_clickable}=    Run Keyword And Return Status    Click Element    ${locator}
        Exit For Loop If    ${is_clickable}
    END