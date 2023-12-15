*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/basePage.robot
Resource        ${EXECDIR}/src/maps/baseMap.robot
Resource        ${EXECDIR}/src/maps/selectTimeMap.robot
Resource        ${EXECDIR}/src/utils/utils.robot

*** Variables ***
${timeout} =    60

*** Keywords ***
esperar elemento carregar "${elemento}"
    ${elementMap} =    select-time map "${elemento}"
    espera elemento "${elementMap}"

clico view pelo resource-id "${element}" com "${taps}" cliques
    ${elementMap} =    view by contains id map "${element}"
    espera elemento "${elementMap}"
    FOR    ${i}    IN RANGE    ${taps}
        Log    Current Index: ${i}
        Click Element    ${elementMap}
    END

clico textView pelo texto "${texto}" com "${taps}" cliques
    ${elementMap} =    textView contains text map "${texto}"
    espera elemento "${elementMap}"
    FOR    ${i}    IN RANGE    ${taps}
        Log    Current Index: ${i}
        Click Element    ${elementMap}
    END

clico view pelo resource-id "${element}"
    ${elementMap} =    view by contains resourceId map "${element}"
    espera elemento "${elementMap}"
    Click Element    ${elementMap}

clico pelo texto "${texto}"
    ${elementMap} =    contains text map "${texto}"
    espera elemento "${elementMap}"
    Click Element    ${elementMap}

insiro o texto "${text}" no elemento "${element}"
    ${elementMap} =    input time map "${element}"
    ${elementFrame} =    input time by frame map "${element}"
#    ${isElementVisible}=    elemento attribute "focused" should be "false" in xpath "${elementMap}"
    ${isPresent}=    elemento is present by xpath "${elementMap}"
    IF    ${isPresent}
        Log    Element is present, nothing to do
    ELSE
        Click Element    ${elementFrame}
    END
    espera elemento "${elementMap}"
    Clear Text    ${elementMap}
    Input Text Into Current Element    ${text}

clico no botao pelo nome "${button}"
    ${botaoMap} =    botao by contains text map "${button}"
    espera elemento "${botaoMap}"
    Click Element    ${botaoMap}

clico no botao pelo id "${button}"
    ${botaoMap} =    botao by contains id map "${button}"
    espera elemento "${botaoMap}"
    Click Element    ${botaoMap}


