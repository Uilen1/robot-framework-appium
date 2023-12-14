*** Settings ***
Documentation       Base para todas as ações com o app

Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/alarmePage.robot

*** Keywords ***
que estou na aba de "${aba}"
    clicar na aba "${aba}"


clico no botao "${botao}"
    clicar no botao "${botao}"

