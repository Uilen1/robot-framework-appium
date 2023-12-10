*** Settings ***
Documentation       Mapeamento dos elementos da tela de seleção das horas


*** Keywords ***

select-time map "${elemento}"
    Log    //android.view.View[contains(@resource-id,'${elemento}')]
    [Return]    //android.view.View[contains(@resource-id,'${elemento}')]

