*** Settings ***
Documentation       Base para todas as ações com o app

Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/selectTimePage.robot

*** Keywords ***
é aberto a tela de "${elemento}"
    esperar elemento carregar "${elemento}"
    
    
seleciono as horas "${hour}" e os minutos "${min}"
#    clico view pelo resource-id "hour" com "2" cliques
    clico textView pelo texto "12" com "1" cliques
#    insiro o texto "${hour}"
#    clico no botao pelo nome "timepicker"
#    clico view pelo resource-id "minute" com "2" cliques
    clico textView pelo texto "55" com "1" cliques
#    insiro o texto "${min}"
    

seleciono o periodo "${texto}"
    clico pelo texto "${texto}"


clico em "${button}"
    clico no botao pelo nome "${button}"
