*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPEN_CART_URL}                https://demo-opencart.com/index.php?route=account/login&language=en-gb
${BROWSER}                      firefox

&{USER_INFORMATION}             USERNAME=tonttu123@gmail.com    PASSWORD=Toljanteri99
&{INVALID_USER_INFORMATION}     USERNAME=invalid@example.com    PASSWORD=wrongpassword

${EMAIL_FIELD}                  id=input-email
${PASSWORD_FIELD}               id=input-password
${LOGIN_BUTTON}                 xpath=//button[@type='submit']

${LOGOUT_LINK}                  xpath=//div/a[contains(text(),'Logout')]
${CONTINUE_LINK}                xpath=//div/a[contains(text(),'Continue')]
${ERROR_MESSAGE}                xpath=//div[@id='alert']/dirv