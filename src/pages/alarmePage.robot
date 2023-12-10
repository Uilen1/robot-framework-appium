*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary
Resource        ${EXECDIR}/src/maps/alarmeMap.robot

*** Keywords ***
clicar na aba "${aba}"
    ${abaMap} =    aba map "${aba}"
    Log    ${abaMap}
    Wait Until Page Contains Element   ${abaMap}
    ...    10s    
    ...    não foi possível encontrar o elemento
    Click Element    ${abaMap}

clicar no botao "${botao}"
    ${botao_map} =     botao map "${botao}"
    Log    ${botao_map}
    Wait Until Page Contains Element   ${botao_map}
    ...    10s
    ...    não foi possível encontrar o elemento
    Click Element    ${botao_map}


