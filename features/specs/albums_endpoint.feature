#language:pt

Funcionalidade: Garantir a estabilidade do endpoint /users
    Eu como um QA do microsserviço
    Quero garantir a estabilidade do endpoint /users
    Para que o sistema esteja livre de falhas

    @smoke_test @albums_mocked_test @#marcos_netto
    Cenario: Validação da resposta da API com dados mockados
        Dado que eu faça uma requisição ao "<endpoint>"
        Então validar a resposta da API com os dados mockados a seguir:
            | atributo | valor esperado           |
            |  user_id | 1                        |
            |   id     | 1                        |
            |  title   | "quidem molestiae enim"  |


        Exemplos:
        | endpoint                  |
        | /albums                   |
        | /albums/1                 |