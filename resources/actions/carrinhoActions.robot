*Settings
Documentation   Acoes da funcionalidade - Verifica Carrinho

*Variables
${detalhe_restaurante}       css=#detail   

*Keywords
Go To restaurants Page
    Click                    text=Estou com fome! 
    Get text                 h1 strong  contains  Ta na hora de matar a fome!

Seleciona um restaurante 
    [Arguments]              ${restaurante}
    Click                    text=${restaurante["name"]}
    Wait for elements state  ${detalhe_restaurante}  visible  5
    Get text                 ${detalhe_restaurante}  contains  ${restaurante["desc"]}  

Coloca o produto no carrinho
    [Arguments]                         ${produto}
    Click                               xpath=//span[text()="${produto}"]/..//a[@class="add-to-cart"]    

Valida produto no carrinho
    [Arguments]                         ${produto}
    Wait for elements state             css=#cart tr >> text=${produto}  visible  5

Valida total produto
    [Arguments]                         ${preco}
    #${text}  Get text                   css=body > mt-app > div > div > div > mt-restaurant-detail > section.content > div:nth-child(2) > mt-menu > div.col-md-9.col-xs-12 > mt-menu-item:nth-child(2) > div > div > span.menu-item-info-box-price
    Get text                            xpath=//th[contains(text(),"Total")]/..//td  contains  ${preco}                           
