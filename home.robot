*** Settings ***
Documentation     Suite de testes home page
Library    Browser

*** Test Cases ***
Home page deve estar online
    New Browser    chromium    headless=False
    New Page    https://walkdog.vercel.app/
    Get Text    h1    contains    Cuidado e diversão em cada passo

    Sleep    2
    Take Screenshot
    
