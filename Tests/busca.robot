*Settings
Library  Browser

*Test Cases
Buscar um restaurante

    New Browser              chromium   false       
    New Page                 https://parodifood.herokuapp.com
    Get Text                 //span[contains(text(),'Nunca foi tão engraçado pedir comida')]  contains  Nunca foi tão engraçado pedir comida
    Take Screenshot          pass-screenshot-{index}
    Click                    text=Estou com fome! 
    Take Screenshot          pass-screenshot-{index}
    Get text                 h1 strong  contains  Ta na hora de matar a fome!
    Click                    .search-link
    Fill text                input[formcontrolname="searchControl"]  pizza
    Take Screenshot          pass-screenshot-{index}
    Wait for elements state  span[class="place-info-box-text"]  visible  5     
    Get text                 span[class="place-info-box-text"]  contains   PIZZA BUZ
    Close Browser

*Keywords