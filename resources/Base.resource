*** Settings ***
Documentation     Suite de testes home page
Library    Browser
Resource    actions/signup.resource


*** Keywords ***

Start session
    New Browser    chromium    headless=False
    New Page    https://walkdog.vercel.app/
    Get Text    h1    contains    Cuidado e diversão em cada passo

Finish session
    Take Screenshot    fullPage=True