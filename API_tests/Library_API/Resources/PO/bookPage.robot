*** Settings ***
Library         SeleniumLibrary
Resource        ../common.robot
Resource        ../testApp.robot

*** Variables ***
${RANDOM_BOOK_URL}              https://openlibrary.org/random.json
${BOOK_TITLE_LOCATOR}           xpath=//div[@class='work-title-and-author desktop']/span/h1
${BROWSER_SEPARATER}            _
${API_SEPARATOR}                +
${SPLITTER}                     /
${TITLE_INDEX}                  -1

*** Keywords ***
Open page
    go to    ${RANDOM_BOOK_URL}
    #go to    https://openlibrary.org/books/OL33200289M/The_physical_atlas

Verify load
    wait until element is visible    ${BOOK_TITLE_LOCATOR}

Parse book title from url
    ${url}=                 get location
    close browser
    ${title}=               common.Extract text from url        ${url}          ${SPLITTER}             ${TITLE_INDEX}
    ${parsed_title}=        common.Replace string separator     ${title}        ${BROWSER_SEPARATER}    ${API_SEPARATOR}
    set global variable     ${SEARCH_TITLE}                     ${parsed_title}