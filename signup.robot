*** Settings ***
Documentation     Suite de testes cadastro
Library    Browser

*** Test Cases ***
Deve realizar cadastro com sucesso
    ${name}    Set Variable    Alicia
    ${email}    Set Variable    alicia@teste.com
    ${cpf}    Set Variable    95595595540
    ${cep}    Set Variable    90035191
    ${addressNumber}    Set Variable    95



    New Browser    chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    500

    Get Text    h1    equal    Faça seu cadastro

    Fill Text    css=input[name="name"]    ${name}
    Fill Text    css=input[name="email"]    ${email}
    Fill Text    css=input[name="cpf"]    ${cpf}
    Fill Text    css=input[name="cep"]    ${cep}
    Fill Text    css=input[name="addressNumber"]    ${addressNumber}


    Click    css=input[value="Buscar CEP"]    
    
    Take Screenshot    


