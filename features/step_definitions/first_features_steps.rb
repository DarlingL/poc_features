Dado("que esteja na tela de login") do
    @screen = First_features.new
    @screen.verify_home_not_logged
  end
  
  Quando("confirmar após inserir credenciais válidas") do
    @screen.click_signin
    @screen.insert_credentials
    @screen.confirm_login
  end
  
  Então("devo visualizar a home do aplicativo") do
    @screen.expected_home
  end
  
  Dado("que esteja logado no aplicativo") do
    steps %{
        Dado que esteja na tela de login
        Quando confirmar após inserir credenciais válidas
        Então devo visualizar a home do aplicativo
      }
  end
  
  Quando("inserir valor após ter selecionado um contato") do
    @screen.pay_contact
  end
  
  Quando("confirmar o pagamento") do
    @screen.confirm_pay
  end
  
  Então("devo visualizar o recibo") do
    @screen.expected_payed
  end