*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

${Sign_In_Button}                   xpath=/html/body/div/div[1]/header/div[2]/div/div/nav/div[1]/a
${Create_An_Account}                xpath=//*[@id="SubmitCreate"]/span
${Lock_Icon}                        xpath=//*[@id="SubmitLogin"]/span
${Sign_Out_Button}                  xpath=//a[text()="Sign out"]
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