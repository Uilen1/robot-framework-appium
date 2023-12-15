*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary

*** Variables ***
${timeout} =    60

*** Keywords ***
espera elemento "${elemento}"
    Log    ${elemento}
    Wait Until Page Contains Element   ${elemento}
    ...    ${timeout}
    ...    não foi possível encontrar o elemento ${elemento}

elemento is present by xpath "${xpath}"
    ${c}=    Get Matching Xpath Count    ${xpath}
    IF    ${c} > 0
        RETURN    True
    ELSE
        RETURN    False
    END

elemento attribute "${attributeName}" should be "${attribute}" in xpath "${xpath}"
    ${c}=    Run Keyword And Return Status    Element Attribute Should Match    ${xpath}    ${attributeName}    ${attribute}
    Log    ${c}
    [Return]    ${c}
        


