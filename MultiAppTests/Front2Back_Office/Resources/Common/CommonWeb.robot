*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#${BROWSER}                     chrome
${BROWSER}                     firefox
#${BROWSER}                     edge

*** Keywords ***
Begin web test
    #set selenium timeout        10s
    #set selenium speed          .1s
    open browser                about:blank    ${BROWSER}
    maximize browser window
    # set window position         x=341   y=169
    # set window size             width=1935      height=1090

End web test
    close all browsers