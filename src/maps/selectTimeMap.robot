*** Settings ***
Documentation       Mapeamento dos elementos da tela de seleção das horas


*** Keywords ***

select-time map "${id}"
    Log    //android.view.View[contains(@resource-id,'${id}')]
    [Return]    //android.view.View[contains(@resource-id,'${id}')]

view by contains resourceId map "${id}"
    Log    //android.view.View[contains(@resource-id,'${id}')]
    [Return]    //android.view.View[contains(@resource-id,'${id}')]

view by resourceId map "${id}"
    Log    //android.view.View[@resource-id='${id}']
    [Return]    //android.view.View[@resource-id='${id}']

view text map "${texto}"
    Log    //*[@text='${texto}']
    [Return]    //*[@text='${texto}']

botao by contains text map "${id}"
    Log    //android.widget.Button[contains(@text,'${id}')]
    [Return]    //android.widget.Button[contains(@text,'${id}')]

