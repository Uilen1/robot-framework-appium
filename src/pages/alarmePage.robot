*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/basePage.robot
Resource        ${EXECDIR}/src/maps/baseMap.robot
Resource        ${EXECDIR}/src/maps/alarmeMap.robot

*** Variables ***
${timeout} =    60

*** Keywords ***
clicar na aba "${aba}"
    ${abaMap} =    aba map "${aba}"
    espera elemento "${abaMap}"
    Click Element    ${abaMap}

clicar no botao "${botao}"
    ${botao_map} =     botao map "${botao}"
    espera elemento "${botao_map}"
    Click Element    ${botao_map}


o alarme com o horario "${horario}" foi salvo
    ${elementMap} =     textView contains text map "${horario}"
    espera elemento "${elementMap}"


