*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${BASE_URL}             https://rahulshettyacademy.com/
${LIBRARY_API_URL}      https://rahulshettyacademy.com/Library/Addbook.php

*** Keywords ***
Add book to library
    [Arguments]     ${name}     ${author}
    ${isbn}=            Evaluate            random.randint(100, 100000)     random
    ${aisle}=           Evaluate            random.randint(100, 100000)     random
    &{request_body}=    create dictionary   name=${name}   isbn=${isbn}     aisle=${aisle}     author=${author}
    ${response}=        POST                ${LIBRARY_API_URL}              json=${request_body}
    RETURN    ${response}