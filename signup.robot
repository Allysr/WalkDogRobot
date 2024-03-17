*** Settings ***
Documentation     Suite de testes cadastro
Library    Browser


*** Test Cases ***
Deve realizar cadastro com sucesso
    ${name}    Set Variable    Alicia
    ${email}    Set Variable    alicia@teste.com
    ${cpf}    Set Variable    00000014141
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
    
    Click    css=input[value="Buscar CEP"]


    Fill Text    css=input[name="addressNumber"]    ${addressNumber}

    Get Property    css=input[name="addressStreet"]    value    equal    Avenida Osvaldo Aranha
    Get Property    css=input[name="addressDistrict"]    value    equal    Bom Fim
    Get Property    css=input[name="addressCityUf"]    value    equal    Porto Alegre/RS

    Click    xpath=//img[contains(@src, '/static/media/train.76340ac43fd11b8a312f.png')]
    
    Upload File By Selector    css=input[type="file"]    ${EXECDIR}/toretto.jpg

    Click    css=.button-register

    Get Text   id=swal2-html-container    equal    Recebemos o seu cadastro e em breve retornaremos o contato.
    
    Click    css=button[class="swal2-confirm swal2-styled"]

    Get Text    h1    contains    Cuidado e diversão em cada passo

    Take Screenshot    


