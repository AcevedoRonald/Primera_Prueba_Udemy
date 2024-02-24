*** Settings ***
Library     String
Library     SeleniumLibrary

**** Variables ***
${browser}      chrome
${homepage}     winstoncastillo.com/robot-selenium/
${scheme}       https
${testUrl}      ${scheme}://${homepage}

***** Keywords ***
Open Homepage
    Open Browser    ${testUrl}      ${browser}

*** Test Cases ***
C001 Hacer Clic en Contenedores
    Open Homepage
    Set Global Variable     @{nombresDeContenedores}    //*[@id="content"]/div[2]/div[1]/div/div[2]/h4/a       //*[@id="content"]/div[2]/div[2]/div/div[2]/h4/a       //*[@id="content"]/div[2]/div[3]/div/div[2]/h4/a        //*[@id="content"]/div[2]/div[4]/div/div[2]/h4/a
    FOR    ${nombreDeContenedor}   IN      @{nombresDeContenedores}
        Click Element    xpath=${nombreDeContenedor}
        Wait Until Element Is Visible   xpath=//*[@id="content"]/div/div[1]/ul[1]/li[1]/a/img
        Click Element    xpath=//*[@id="logo"]/h1/a
    END
    Close Browser

