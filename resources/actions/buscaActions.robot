*Settings
Documentation   Acoes da funcionalidade - Busca Restaurantes

*Variables
${Div_Restaurant}            span[class="place-info-box-text"]    

*Keywords
Search Restaurants By 
    [Arguments]              ${value}
    Click                    .search-link
    Fill text                input[formcontrolname="searchControl"]  ${value}

Validate Search
    [Arguments]              ${value}  ${quantity}
    Wait for elements state  ${Div_Restaurant}  visible    5    
    Get text                 ${Div_Restaurant}  contains   ${value}    
    Get Element Count        ${Div_Restaurant}  equal      ${quantity}