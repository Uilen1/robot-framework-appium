*** Settings ***
Documentation       Contém todos os metodos para a pagina de alarme
Library         AppiumLibrary
Resource        ${EXECDIR}/src/pages/basePage.robot
Resource        ${EXECDIR}/src/maps/baseMap.robot
Resource        ${EXECDIR}/src/maps/selectTimeMap.robot

*** Variables ***
${timeout} =    60

*** Keywords ***
esperar elemento carregar "${elemento}"
    ${elementMap} =    select-time map "${elemento}"
    espera elemento "${elementMap}"

clico view pelo resource-id "${element}" com "${taps}" cliques
    ${elementMap} =    view by resourceId map "${element}"
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

insiro o texto "${element}"
    ${elementMap} =    view by contains resourceId map "${element}"
    espera elemento "${elementMap}"
    Input Text Into Current Element    ${elementMap}

clico no botao pelo nome "${button}"
    ${botaoMap} =    botao by contains text map "${button}"
    espera elemento "${botaoMap}"
    Click Element    ${botaoMap}


