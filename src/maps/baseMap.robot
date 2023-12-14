*** Settings ***
Documentation       Mapeamento dos elementos da tela de seleção das horas


*** Keywords ***

textView contains text map "${texto}"
    Log    //android.widget.TextView[contains(@text,'${texto}')]
    [Return]    //android.widget.TextView[contains(@text,'${texto}')]

contains text map "${texto}"
    Log    //*[contains(@text,'${texto}')]
    [Return]    //*[contains(@text,'${texto}')]
