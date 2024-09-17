*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

# Locators for search box, search button, and result count
${SEARCH_BOX}                       xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[2]/form/input[4]
${SEARCH_BUTTON}                    css=button.btn.btn-default
${RESULT_COUNT_ELEMENT}             xpath=/html/body/div/div[2]/div/div[3]/div[2]/div[1]/div[2]/div[2]

# Expected values
${EXPECTED_RESULT_COUNT}            7
${SEARCH_TERM}                      dress