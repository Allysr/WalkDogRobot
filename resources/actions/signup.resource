*** Settings ***
Documentation     Suite de testes cadastro
Library    Browser

*** Keywords ***

Go to signup page

    [Arguments]    ${dog_walker}

    Click    css=a[href="/signup"]    

    Wait For Elements State    form h1    visible    500
    Get Text    h1    equal    ${dog_walker}[signup_page_text]


Fill signup form

    [Arguments]    ${dog_walker}

    Fill Text    css=input[name="name"]    ${dog_walker}[name]
    Fill Text    css=input[name="email"]    ${dog_walker}[email]
    Fill Text    css=input[name="cpf"]    ${dog_walker}[cpf]
    Fill Text    css=input[name="cep"]    ${dog_walker}[cep]
    
    Click    css=input[value="Buscar CEP"]


    Fill Text    css=input[name="addressNumber"]    ${dog_walker}[adress_number]
    Get Property    css=input[name="addressStreet"]    value    equal    ${dog_walker}[adress_street]
    Get Property    css=input[name="addressDistrict"]    value    equal    ${dog_walker}[address_district]
    Get Property    css=input[name="addressCityUf"]    value    equal    ${dog_walker}[address_city_uf]

    Click    xpath=//img[contains(@src, '/static/media/train.76340ac43fd11b8a312f.png')]
    
    Upload File By Selector    css=input[type="file"]    ${dog_walker}[cnh]


Submit signup form

    [Arguments]    ${dog_walker}

    Click    css=.button-register
    

Popup should be

    [Arguments]    ${dog_walker} 

    Get Text   id=swal2-html-container    equal    ${dog_walker}[modal_text]

Cpf error

    [Arguments]    ${dog_walker} 

    Get Text    css=.alert-error    equal    ${dog_walker}[cpf_alert_error]
