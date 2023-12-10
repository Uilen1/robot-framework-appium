*** Settings ***
Documentation       Ações de venda no PDV
Resource            ${EXECDIR}/src/actions/baseActions.robot

*** Keywords ***
abro o PDV
    Click   menu-vendas.png

seleciono o Funcionario "${funcionario}"
    Press Special Key       F1
    Double Click            ${funcionario}.png

adiciono um produto "${produto}" e a quantidade "${quantidade}"
    Press Special Key       F3
    Double Click            ${produto}.png
    Input Text              campo-quantidade.png    ${quantidade}
    Press Special Key       ENTER

finalizo a venda
    Press Special Key       F6

finalizo teste
    Finaliza Teste

fecho o pedido com sucesso
    Exists      msgbox-pedido-sucesso.png
    [Teardown]      Finaliza Teste