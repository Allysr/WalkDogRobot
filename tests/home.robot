*** Settings ***
Documentation     Suite de testes home page
Library    Browser

*** Test Cases ***
Home page deve estar online

    ${homePageText}    Set Variable    Cuidado e diversão em cada passo

    Go to home page    ${homePageText}


*** Keywords ***

Go to home page    
    [Arguments]    ${homePageText}
    New Browser    chromium    headless=False
    New Page    https://walkdog.vercel.app/
    Get Text    h1    contains    ${homePageText}

    Sleep    2
    Take Screenshot
    
