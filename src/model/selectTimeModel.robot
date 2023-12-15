*** Settings ***
Documentation       Base para todas as ações com o app

Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/selectTimePage.robot

*** Keywords ***
é aberto a tela de "${elemento}"
    esperar elemento carregar "${elemento}"
    
    
seleciono as horas "${hour}" e os minutos "${min}"
    clico textView pelo texto "${hour}" com "1" cliques
    clico textView pelo texto "${min}" com "1" cliques


digito as horas "${hour}" e os minutos "${min}"
    clico no botao pelo id "mode"
    insiro o texto "${hour}" no elemento "Hour"
    insiro o texto "${min}" no elemento "Minute"


seleciono o periodo "${texto}"
    clico pelo texto "${texto}"


clico em "${button}"
    clico no botao pelo nome "${button}"
