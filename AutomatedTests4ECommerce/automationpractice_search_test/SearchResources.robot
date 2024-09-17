*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.automationpractice.pl/index.php
${BROWSER}                          firefox

${SEARCH_BOX}                       id=search_query_top
${SEARCH_BUTTON}                    xpath=//button[@type='submit']
${RESULT_COUNT_ELEMENT}             xpath=//div[@class='product-count']
${SEARCH_RESULT_LIST}               //ul[@class='product_list grid row']/li

${EXPECTED_RESULT_COUNT}            7
${SEARCH_TERM}                      dress