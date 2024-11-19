*** Settings ***
Documentation   This layer gets data from external files.
Library         ../CustomLibs/Csv.py

*** Keywords ***
Get csv data
    [Arguments]     ${filepath}
    ${data} =       read csv file    ${filepath}
    RETURN          ${data}