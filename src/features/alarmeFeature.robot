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

