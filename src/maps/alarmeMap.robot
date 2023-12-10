*** Settings ***
Documentation       Mapeamento dos elementos da tela de alarme


*** Keywords ***

aba map "${aba}"
    Log    //android.widget.FrameLayout[contains(@content-desc,'${aba}')]
    [Return]    //android.widget.FrameLayout[contains(@content-desc,'${aba}')]

botao map "${botao}"
    Log    //android.widget.Button[contains(@content-desc,'${botao}')]
    [Return]    //android.widget.Button[contains(@content-desc,'${botao}')]
