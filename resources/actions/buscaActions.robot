*Settings
Documentation   Acoes da funcionalidade - Busca Restaurantes

*Variables
${Div_Restaurant}            span[class="place-info-box-text"]    

*Keywords
Search Restaurants By 
    [Arguments]              ${value}
    Click                    .search-link
    Fill text                input[formcontrolname="searchControl"]  ${value}

Seleciona um restaurante 
    [Arguments]              ${massa_teste}
    Click                    text=${massa_teste["restaurante"]}
    Wait for elements state  ${detalhe_restaurante}  visible  5
    Get text                 ${detalhe_restaurante}  contains  ${massa_teste["desc"]}  

Validate Search
    [Arguments]              ${value}  ${quantity}
    Wait for elements state  ${Div_Restaurant}  visible    5    
    Get text                 ${Div_Restaurant}  contains   ${value}    
    Get Element Count        ${Div_Restaurant}  equal      ${quantity}