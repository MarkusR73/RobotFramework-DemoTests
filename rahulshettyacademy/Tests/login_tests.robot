*** Settings ***
Resource        ../Resources/testApp.robot
Resource        ../Resources/common.robot
Resource        ../Data/login_data.robot
Test Setup      common.Begin web test
Test Teardown   common.End web test

# Run tests:
# robot -d Results Tests/login_tests.robot

*** Test Cases ***
Login process should be successful with valid credentials
    [Tags]  0001    valid   login   smoke
    [Template]      testApp.Multiple valid login scenarios
    ${ADMIN_CREDENTIALS_TEACH}
    ${ADMIN_CREDENTIALS_STUD}
    ${ADMIN_CREDENTIALS_CONSULT}
    ${USER_CREDENTIALS_TEACH}
    ${USER_CREDENTIALS_STUD}
    ${USER_CREDENTIALS_CONSULT}

Login process should fail with invalid credentials
    [Tags]  0002    invalid     login   smoke
    [Template]      testApp.Multiple invalid login scenarios
    ${ADMIN_CREDENTIALS_TEACH_UNREG}
    ${ADMIN_CREDENTIALS_STUD_UNREG}
    ${ADMIN_CREDENTIALS_CONSULT_UNREG}
    ${USER_CREDENTIALS_TEACH_UNREG}
    ${USER_CREDENTIALS_STUD_UNREG}
    ${USER_CREDENTIALS_CONSULT_UNREG}
    ${ADMIN_CREDENTIALS_TEACH_EMPTY}
    ${ADMIN_CREDENTIALS_STUD_EMPTY}
    ${ADMIN_CREDENTIALS_CONSULT_EMPTY}
    ${USER_CREDENTIALS_TEACH_EMPTY}
    ${USER_CREDENTIALS_STUD_EMPTY}
    ${USER_CREDENTIALS_CONSULT_EMPTY}
