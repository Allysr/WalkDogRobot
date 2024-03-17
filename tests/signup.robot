*** Settings ***
Documentation     Suite de testes cadastro
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Finish session



*** Test Cases ***
Deve realizar cadastro com sucesso

    ${dog_walker}    Create Dictionary    
    ...    name=Alicia    
    ...    email=alicia@teste.com    
    ...    cpf=00000014141    
    ...    cep=90035191    
    ...    adress_number=95    
    ...    adress_street=Avenida Osvaldo Aranha    
    ...    address_district=Bom Fim    
    ...    address_city_uf=Porto Alegre/RS    
    ...    signup_page_text=Faça seu cadastro    
    ...    modal_text=Recebemos o seu cadastro e em breve retornaremos o contato.    
    ...    page_text=Cuidado e diversão em cada passo    
    ...    cnh=${EXECDIR}/fixtures/toretto.jpg

    Go to signup page    ${dog_walker}   
    Fill signup form    ${dog_walker}    
    Submit signup form    ${dog_walker}   
    Popup should be    ${dog_walker}

*** Test Cases ***
Não deve realizar cadastro se o cpf for incorreto
    [Tags]    cpf_invalido

    ${dog_walker}    Create Dictionary    
    ...    name=Alicia    
    ...    email=alicia@teste.com    
    ...    cpf=000000teste   
    ...    cep=90035191    
    ...    adress_number=95    
    ...    adress_street=Avenida Osvaldo Aranha    
    ...    address_district=Bom Fim    
    ...    address_city_uf=Porto Alegre/RS    
    ...    signup_page_text=Faça seu cadastro    
    ...    modal_text=Recebemos o seu cadastro e em breve retornaremos o contato.    
    ...    page_text=Cuidado e diversão em cada passo    
    ...    cnh=${EXECDIR}/fixtures/toretto.jpg    
    ...    cpf_alert_error=CPF inválido

    Go to signup page    ${dog_walker}   
    Fill signup form    ${dog_walker}    
    Submit signup form    ${dog_walker} 
    Cpf error    ${dog_walker}  


*** Test Cases ***
Não deve realizar cadastro se os compos obrigatórios não forem preenchidos
    [Tags]    campos_obrigatorios

    ${dog_walker}    Create Dictionary    
    ...    signup_page_text=Faça seu cadastro    
    ...    page_text=Cuidado e diversão em cada passo    

    Go to signup page    ${dog_walker}   
    Submit signup form    ${dog_walker} 



