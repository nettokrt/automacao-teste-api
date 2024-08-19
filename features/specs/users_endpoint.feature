#language:pt

Funcionalidade: Garantir a estabilidade do endpoint /users
    Eu como um QA do microsserviço
    Quero garantir a estabilidade do endpoint /users
    Para que o sistema esteja livre de falhas

    @smoke_test @users @endpoint_users @#marcos_netto
    Cenario: Validação da resposta da API com dados mockados
        Dado que eu faça uma requisição ao "<endpoint>"
        Então validar a resposta da API com dados mockados
        
        Exemplos:
        | endpoint                 |
        | /users                   |
        | /users/1                 |        

    @smoke_test @contract_users @endpoint_users @#marcos_netto
    Cenario: Validar as regras de contrato
        Dado que eu faça uma requisição ao "<endpoint>"
        Então a resposta deve seguir as regras de contrato
        
        Exemplos:
        | endpoint                 |
        | /users/1                 | 