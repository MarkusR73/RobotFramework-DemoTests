*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

${SIGN_IN_BUTTON}                   xpath=//a[contains(text(),'Sign in')]
${CREATE_AN_ACCOUNT_BUTTON}         xpath=//button[@id='SubmitCreate']

${CREATE_EMAIL_FIELD}               xpath=//input[@id='email_create']
${REGISTRATION_FORM_HEADER}         xpath=//h3[contains(text(),'Your personal information')]
${GENDER_SELECTOR_MR}               id=id_gender1
${FIRSTNAME_FIELD}                  id=customer_firstname
${LASTNAME_FIELD}                   id=customer_lastname
${PASSWORD_FIELD}                   id=passwd
${BIRTHDAY_SELECTOR}                id=days
${BIRTHDAY}                         1
${BIRTH_MONTH_SELECTOR}             id=months
${BIRTH_MONTH}                      1
${BIRTH_YEAR_SELECTOR}              id=years
${BIRTH_YEAR}                       2000
${REGISTER_BUTTON}                  id=submitAccount
${SUCCESS_MESSAGE}                  xpath=//p[contains(text(),'Your account has been created.')]

${Lock_Icon}                        xpath=//*[@id="SubmitLogin"]/span
${Sign_Out_Button}                  xpath=//a[@class='logout']
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