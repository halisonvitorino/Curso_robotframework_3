*Settings
Documentation    Arquivo base do projeto
Library          Browser 
Library          OperatingSystem
Resource         actions/buscaActions.robot
Resource         actions/carrinhoActions.robot

*Keywords
Start Session
    New Browser  chromium   false       
    New Page     https://parodifood.herokuapp.com
    Get Text     //span[contains(text(),'Nunca foi tão engraçado pedir comida')]  contains  Nunca foi tão engraçado pedir comida

Go To restaurants Page
    Click                    text=Estou com fome! 
    Get text                 h1 strong  contains  Ta na hora de matar a fome!
    
### Helpers ###
Get JSON
    [Arguments]         ${nome_arquivo_massa}

    ${massa_teste}      Get File   ${EXECDIR}/resources/fixtures/${nome_arquivo_massa}
    ${super_variavel}   Evaluate   json.loads($massa_teste)   json 

    [Return]            ${super_variavel}
    
