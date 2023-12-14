*** Settings ***
Documentation       Configuração de um alarme
Suite Setup         abrir aplicativo
Suite Teardown      fechar aplicativo
Resource            ${EXECDIR}/src/config/BDDpt-br.robot
Resource            ${EXECDIR}/src/config/baseConfiguration.robot
Resource            ${EXECDIR}/src/model/alarmeModel.robot
Resource            ${EXECDIR}/src/model/selectTimeModel.robot
Resource            ${EXECDIR}/src/model/baseModel.robot


*** Test Cases ***
Cenario 01: validar que é aberto a tela de cadastrar alarmes
    [Tags]    validado
    Dado que estou na aba de "Alarm"
    Quando clico no botao "Add"
    Então é aberto a tela de "material_clock_hand"
    [Teardown]    obtem evidencia para o cenario "Cenario-01_alarmeFeature"

    
Cenario 02: validar que é salvo o alarme
    [Tags]    validado
    [Setup]    E clico em "Cancel"
    Dado que estou na aba de "Alarm"
    Quando clico no botao "Add"
    E seleciono as horas "10" e os minutos "45"
    E seleciono o periodo "PM"
    E clico em "OK"
    Então o alarme com o horario "10:45" foi salvo
    [Teardown]    obtem evidencia para o cenario "Cenario-02_alarmeFeature"

