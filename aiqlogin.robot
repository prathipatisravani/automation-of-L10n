*** Settings ***
Library     SeleniumLibrary
Resource  ../Resources/resource.robot
Suite Setup  login aiq site
Suite Teardown   close all browsers
*** Test Cases ***
AutomateAIQ
    check title
    enter username and password
    click on signin
    sleep   20
close popups
    close first popup
    close second popup
    close third popup
japanese
    get english text
    select japanese language
    get english text from japanese
    extracting english characters from japanese
chinese
    select chinese language
    get english text from chinese
    extracting english characters from chinese
