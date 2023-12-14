*** Settings ***
Documentation       Base para todas as ações

Library         AppiumLibrary
Library         Process
Resource        ${EXECDIR}/src/pages/selectTimePage.robot
Resource        ${EXECDIR}/src/pages/alarmePage.robot

*** Variables ***
${EVIDENCES_DIR}    ${EXECDIR}/src/resources/evidences

*** Keywords ***
obtem evidencia para o cenario "${cenario}"
    Capture Page Screenshot    ${EVIDENCES_DIR}/${cenario}.png