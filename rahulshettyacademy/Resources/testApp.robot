*** Settings ***
Resource    PO/shop.robot
Resource    PO/cart.robot
Resource    PO/login.robot
Resource    PO/child.robot

*** Keywords ***
Multiple valid login scenarios
    [Arguments]     ${credentials}
    common.Begin login test
    Fill the login form     ${credentials}
    login.Sign in
    login.verify success

Multiple invalid login scenarios
    [Arguments]     ${credentials}
    common.Begin login test
    Fill the login form     ${credentials}
    login.Sign in
    login.Verify error message visibility    ${credentials.ERROR_MESSAGE_LOCATOR}

Move to login page
    login.Open page
    login.Verify load

Fill the login form
    [Arguments]     ${credentials}
    login.Fill in user information      ${credentials.USERNAME}     ${credentials.PASSWORD}
    login.Choose usertype               ${credentials.USERTYPE}
    login.Choose role                   ${credentials.USERROLE}
    login.Agree to terms and conditions


Move to child window
    login.Open child window
    common.Switch to child window
    child.Verify load

Extract email address from child window
    ${extracted_email}=             child.Extract email address from page
    child.Verify email address      ${extracted_email}

Return to login page
    common.Switch to main window
    login.verify load

Fill in extracted email
    [Arguments]     ${email}
    login.Fill in user information      ${email}    None

Move to shop page
    shop.Open page
    shop.Verify load

Verify product titles
    [Arguments]     ${product_titles}
    shop.Verify products on page    ${product_titles}

Select products by title
    [Arguments]    ${product_titles}
    shop.Add selected products to cart    ${product_titles}

Check cart products
    [Arguments]    ${product_titles}
    shop.Move to cart
    cart.Verify load
    cart.Check products    ${product_titles}
