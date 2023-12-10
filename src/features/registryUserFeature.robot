*** Settings ***
Documentation       Feature de Cadastro do usuário
Resource            ${EXECDIR}/src/actions/baseActions.robot
Resource            ${EXECDIR}/src/actions/registryActions.robot
Resource            ${EXECDIR}/config/BDDpt-br.robot

*** Test Cases ***
Cenário 01: Vender o melhor combo
    Dado    que a sessão esta iniciada
    Quando    abro o PDV
    #E seleciono o Funcionario "func-fernando"
    #E adiciono um produto "produto-coxinha" e a quantidade "1"
    #E finalizo a venda
    Então    finalizo teste




