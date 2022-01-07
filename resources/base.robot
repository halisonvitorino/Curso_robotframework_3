*Settings
Documentation  Arquivo base do projeto
Library        Browser 
#Resource       ${EXECDIR}/resources/actions/buscaActions.robot
Resource       ${EXECDIR}/resources/actions/carrinhoActions.robot

*Keywords
Start Session
    New Browser  chromium   false       
    New Page     https://parodifood.herokuapp.com
    Get Text     //span[contains(text(),'Nunca foi tão engraçado pedir comida')]  contains  Nunca foi tão engraçado pedir comida