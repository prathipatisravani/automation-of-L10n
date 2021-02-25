*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  String
*** Variables ***
${url}   https://aiq.netapp.com/
${browser}  chrome
${username}     PM0C89634
${password}     Pr!y@nk@28$
*** Keywords ***
login aiq site
    open browser    ${url}  ${browser}
    maximize browser window
check title
    title should be  NetApp Login Page
enter username and password
    input text      id:username  ${username}
    input text      id:password  ${password}
click on signin
    click element   xpath://html/body/div/div[2]/div/div/form/input[2]
close first popup
    click element  xpath://*[@id="18054acb-a08e-3e49-325d-1124886d5bec"]/div
close second popup
    click element  xpath://*[@id="walkme-survey-balloon-76177"]/div/div[1]/div[2]/div/div[1]
close third popup
    click element  xpath://*[@id="829ad5df-1634-4ce4-bf72-6b12f079e87a"]
get english text
    ${english}  gettext  xpath://html/body
    create file  ${EXECDIR}/english.txt  ${english}
select japanese language
    click element    xpath:/html/body/aiq-root/div[1]/aiq-sidenav/mat-sidenav-container/mat-sidenav-content/div/div/div/aiq-page-header/div[2]/div[2]/aiq-header-actions/div[1]/div/div[4]/aiq-select-language/div/div/aiq-text/span
    click element   xpath://*[@id="cdk-overlay-0"]/div/div/button[2]
    capture page screenshot     Japanese.png
    sleep  5
get english text from japanese
    ${japan}  gettext  xpath://html/body
    create file  ${EXECDIR}/japan.txt  ${japan}
extracting english characters from japanese
    ${root}  gettext  xpath://html/body
    ${j}  Get Regexp Matches  ${root}   [a-zA-Z]
    log to console  ${j}
select chinese language
    click element  xpath:/html/body/aiq-root/div[1]/aiq-sidenav/mat-sidenav-container/mat-sidenav-content/div/div/div/aiq-page-header/div[2]/div[2]/aiq-header-actions/div[1]/div/div[4]/aiq-select-language/div/div/aiq-text/span
    click element  xpath://*[@id="cdk-overlay-0"]/div/div/button[3]
    capture page screenshot     chinese.png
    sleep  5
get english text from chinese
    ${china}  gettext  xpath://html/body
    create file  ${EXECDIR}/china.txt  ${china}
extracting english characters from chinese
    ${root1}  gettext  xpath://html/body
    ${c}  Get Regexp Matches  ${root1}   [a-zA-Z]
    log to console  ${c}

close the browser
    close all browsers