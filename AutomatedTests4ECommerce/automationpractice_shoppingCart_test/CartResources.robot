*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

&{USER_INFORMATION}     FIRSTNAME=None  LASTNAME=None   EMAIL=None     PASSWORD=None    BIRTHDAY=1  BIRTH_MONTH=1   BIRTH_YEAR=2000     ADDRESS=None    CITY=None   STATE=1  POSTCODE=90500  COUNTRY=21  PHONE_NUM=+358 666 5555

${SIGN_IN_LINK}                     xpath=//a[contains(text(),'Sign in')]
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
${SUCCESS_MESSAGE_REGISTRATION}     xpath=//p[contains(text(),'Your account has been created.')]

${LOGIN_EMAIL_FIELD}                id=email
${LOGIN_PASSWORD_FIELD}             id=passwd
${LOCK_ICON}                        id=SubmitLogin
${SIGN_OUT_LINK}                    xpath=//a[@class='logout']
${WRONG_PASSWORD}                   wrong

${DRESSES_LINK}                     xpath=//div[6]/ul/li[2]/a[@title='Dresses']
${CHOSEN_DRESS}                     xpath=//li[4]/div/div[2]/h5/a[@title='Printed Summer Dress']
${COLOR_WHITE}                      id=color_8
${WOMEN_LINK}                       xpath=//a[@title="Women"]
${BLOUSE_LINK}                      xpath=//a[@class='product-name' and @title='Blouse']
${PRODUCT_LIST_COUNT}               xpath=//div[2]/div[2][@class='product-count']                  
${ADD_TO_CART_ELEMENT}              xpath=//p[@id='add_to_cart']/button
${SUCCESS_MESSAGE_PRODUCT_ADDED}    xpath=//h2[contains(., 'Product successfully added to your shopping cart')]
${CONTINUE_SHOPPING_LINK}           xpath=//span[@title='Continue shopping'] 
${HOME_ICON}                        xpath=//a[@title='Return to Home']

${PRODUCT_COUNT_ELEMENT}            xpath=//span[@id='summary_products_quantity']
${CART_LINK}                        xpath=//b[text()='Cart']
${SUMMARY_TEXT}                     xpath=//h1[@id='cart_title']
${DELETE_ICON_DRESS}                xpath=//a[@id='6_40_0_0']/i
${DRESS_LOCATOR}                    //tr[@id='product_6_40_0_0']

${TOTAL_PRICE}                      id=total_price

${CHECKOUT_LINK}                    xpath=//p/a[@title='Proceed to checkout']
${YOUR_ADDRESSES_HEADER}            xpath=//h1[text()='Your addresses']
${ADDRESS_FIELD}                    id=address1
${CITY_FIELD}                       id=city
${STATE_LIST}                       id=id_state
${POSTCODE_FIELD}                   id=postcode
${COUNTRY_LIST}                     id=id_country
${HOME_PHONE_FIELD}                 id=phone
${SAVE_BUTTON}                      id=submitAddress
${CHECKBOX_DELIVERY_ADDRESS}        xpath=//div[@class='checker']/span
${PROCEED_TO_CHECKOUT_BUTTON}       xpath=//p/button[@type='submit']
${AGREE_TERMS_CHECKBOX}             id=cgv
${AGREE_TERMS_CHECKBOX_VALUE}       xpath=//div[@class='checker']/span
${PAY_BY_CHECK_ELEMENT}             xpath=//a[@class='cheque']
${CONFIRM_MY_ORDER_BUTTON}          xpath=//p/button[@type='submit']
${ORDER_COMPLETE_MESSAGE}           xpath=//p[@class='alert alert-success']
