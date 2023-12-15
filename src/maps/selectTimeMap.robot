*** Settings ***
Documentation       Mapeamento dos elementos da tela de seleção das horas


*** Keywords ***

select-time map "${id}"
    Log    //android.view.View[contains(@resource-id,'${id}')]
    [Return]    //android.view.View[contains(@resource-id,'${id}')]

view by contains id map "${id}"
    Log    //android.view.View[contains(@resource-id,'${id}')][last()]
    [Return]    //android.view.View[contains(@resource-id,'${id}')][last()]

view by id map "${id}"
    Log    id=${id}
    [Return]    id=${id}

view text map "${texto}"
    Log    //*[@text='${texto}']
    [Return]    //*[@text='${texto}']

view text map "${texto}"
    Log    //*[@text='${texto}']
    [Return]    //*[@text='${texto}']

input time map "${texto}"
    Log    //*[contains(@text,'${texto}')][last()]/../android.widget.FrameLayout/android.widget.EditText
    [Return]    //*[contains(@text,'${texto}')][last()]/../android.widget.FrameLayout/android.widget.EditText

input time by frame map "${texto}"
    Log    //*[contains(@text,'${texto}')][last()]/../android.widget.FrameLayout
    [Return]    //*[contains(@text,'${texto}')][last()]/../android.widget.FrameLayout


botao by contains text map "${id}"
    Log    //android.widget.Button[contains(@text,'${id}')]
    [Return]    //android.widget.Button[contains(@text,'${id}')]

botao by contains id map "${id}"
    Log    //android.widget.Button[contains(@resource-id,'${id}')][last()]
    [Return]    //android.widget.Button[contains(@resource-id,'${id}')][last()]

