*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary
Resource        ${EXECDIR}/src/maps/selectTimeMap.robot

*** Keywords ***
esperar elemento carregar "${elemento}"
    ${elementMap} =    select-time map "${elemento}"
    Log    ${elementMap}
    Wait Until Page Contains Element   ${elementMap}
    ...    10s    
    ...    não foi possível encontrar o elemento

