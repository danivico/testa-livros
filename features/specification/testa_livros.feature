# language: pt
Funcionalidade: Efetuar acesso na loja de Serviços
    Como usuário do sistema
    Eu quero buscar um livro
    Para ver o titulo

Contexto: Acessando a Loja de Serviços
    Dado que eu esteja na home da loja submarino

@submarino
Cenario: Acessando a Loja de Serviços
    Dado que eu esteja na home da loja submarino
    Quando eu procuro pelo primeiro livro
    Então eu copio o ISBN e pesquiso em outros sites