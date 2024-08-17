#language:pt

Funcionalidade: Garantir a estabilidade do endpoint /users
    Eu como um QA do microsserviço
    Quero garantir a estabilidade do endpoint /users
    Para que o sistema esteja livre de falhas
    
    @smoke_test @#marcos_netto
    Cenario: Validar status code 200
        Quando eu faço uma requisição ao "<endpoint>"
        Então o status code deve ser 200
        
        Exemplos:
        | endpoint                 |
        | /users                   |
        | /users/1                 |
