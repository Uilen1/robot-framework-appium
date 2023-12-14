*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary

*** Variables ***
${timeout} =    60

*** Keywords ***
espera elemento "${elemento}"
    Log    ${elemento}
    Wait Until Page Contains Element   ${elemento}
    ...    ${timeout}
    ...    não foi possível encontrar o elemento


