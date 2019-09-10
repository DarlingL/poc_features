# language: pt
Funcionalidade: Primeiras Funcionalidades
  Automatizar funcionalidades simples do aplicativo picpay
    

@android
Cenário: Realizar login no Aplicativo
  Dado que esteja na tela de login
  Quando confirmar após inserir credenciais válidas
  Então devo visualizar a home do aplicativo

@android
Cenário: Realizar uma Transação 
  Dado que esteja logado no aplicativo
  Quando inserir valor após ter selecionado um contato
  E confirmar o pagamento
  Então devo visualizar o recibo