*** Settings ***

*** Variables ***
${INCORRECT_ERROR}=                     xpath=//div[@style='display: block;' and contains(string(.), 'Incorrect')]
${EMPTY_ERROR}=                         xpath=//div[@style='display: block;' and contains(string(.), 'Empty')]

&{ADMIN_CREDENTIALS_TEACH}=             USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=admin      USERROLE=teach
&{ADMIN_CREDENTIALS_STUD}=              USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=admin      USERROLE=stud
&{ADMIN_CREDENTIALS_CONSULT}=           USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=admin      USERROLE=consult
&{USER_CREDENTIALS_TEACH}=              USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=user       USERROLE=teach
&{USER_CREDENTIALS_STUD}=               USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=user       USERROLE=stud
&{USER_CREDENTIALS_CONSULT}=            USERNAME=rahulshettyacademy     PASSWORD=learning       USERTYPE=user       USERROLE=consult

&{ADMIN_CREDENTIALS_TEACH_UNREG}=       USERNAME=Nemo                   PASSWORD=qwerty         USERTYPE=admin      USERROLE=teach      ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}
&{ADMIN_CREDENTIALS_STUD_UNREG}=        USERNAME=Pena                   PASSWORD=qwerty         USERTYPE=admin      USERROLE=stud       ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}
&{ADMIN_CREDENTIALS_CONSULT_UNREG}=     USERNAME=Jugi                   PASSWORD=qwerty         USERTYPE=admin      USERROLE=consult    ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}
&{USER_CREDENTIALS_TEACH_UNREG}=        USERNAME=Jamo                   PASSWORD=qwerty         USERTYPE=user       USERROLE=teach      ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}
&{USER_CREDENTIALS_STUD_UNREG}=         USERNAME=Peno                   PASSWORD=qwerty         USERTYPE=user       USERROLE=stud       ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}
&{USER_CREDENTIALS_CONSULT_UNREG}=      USERNAME=Susi                   PASSWORD=qwerty         USERTYPE=user       USERROLE=consult    ERROR_MESSAGE_LOCATOR=${INCORRECT_ERROR}

&{ADMIN_CREDENTIALS_TEACH_EMPTY}=       USERNAME=                       PASSWORD=               USERTYPE=admin      USERROLE=teach      ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
&{ADMIN_CREDENTIALS_STUD_EMPTY}=        USERNAME=                       PASSWORD=               USERTYPE=admin      USERROLE=stud       ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
&{ADMIN_CREDENTIALS_CONSULT_EMPTY}=     USERNAME=                       PASSWORD=               USERTYPE=admin      USERROLE=consult    ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
&{USER_CREDENTIALS_TEACH_EMPTY}=        USERNAME=                       PASSWORD=               USERTYPE=user       USERROLE=teach      ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
&{USER_CREDENTIALS_STUD_EMPTY}=         USERNAME=                       PASSWORD=               USERTYPE=user       USERROLE=stud       ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
&{USER_CREDENTIALS_CONSULT_EMPTY}=      USERNAME=                       PASSWORD=               USERTYPE=user       USERROLE=consult    ERROR_MESSAGE_LOCATOR=${EMPTY_ERROR}
