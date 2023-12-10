*** Settings ***
Documentation       Base para todas as ações com o app

Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/selectTimePage.robot

*** Keywords ***
é aberto a tela de "${elemento}"
    esperar elemento carregar "${elemento}"