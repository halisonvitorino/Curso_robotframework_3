*Settings
Library  Browser

*Test Cases
Deve buscar um unico restaurante
    Start Session
    Go To restaurants Page
    Search Restaurants By    Debuger
    Validate Search          DEBUGER KING  1
    Close Browser


Deve buscar por categoria
    Start Session
    Go To restaurants Page
    Search Restaurants By    cafe
    Validate Search          STARBUGS COFFEE  1
    Close Browser


*Keywords
Start Session
    New Browser              chromium   false       
    New Page                 https://parodifood.herokuapp.com
    Get Text                 //span[contains(text(),'Nunca foi tão engraçado pedir comida')]  contains  Nunca foi tão engraçado pedir comida

Go To restaurants Page
    Click                    text=Estou com fome! 
    Get text                 h1 strong  contains  Ta na hora de matar a fome!

Search Restaurants By 
    [Arguments]              ${value}
    Click                    .search-link
    Fill text                input[formcontrolname="searchControl"]  ${value}

Validate Search
    [Arguments]              ${value}  ${quantity}
    Wait for elements state  span[class="place-info-box-text"]  visible    5    
    Get text                 span[class="place-info-box-text"]  contains   ${value}
    Take Screenshot          pass-screenshot-{index}
    Get Element Count        span[class="place-info-box-text"]  equal      ${quantity}