*Settings
Documentation   Acoes da funcionalidade - Verifica Carrinho

*Variables
${detalhe_restaurante}       css=#detail   

*Keywords
Coloca o produto no carrinho
    [Arguments]              ${produto}
    Click                    xpath=//span[text()="${produto}"]/..//a[@class="add-to-cart"]    

Valida produto no carrinho
    [Arguments]              ${produto}
    Wait for elements state  css=#cart tr >> text=${produto}  visible  5

Valida total produto
    [Arguments]              ${valor_esperado}

    ${valor_encontrado}      Get text  xpath=//th[contains(text(),"Total")]/..//td
    log                      ${valor_esperado}
    log                      ${valor_encontrado}
    Get text  xpath=//th[contains(text(),"Total")]/..//td  contains  ${valor_esperado}