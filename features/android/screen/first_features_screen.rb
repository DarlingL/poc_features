class First_features 

    def initialize
        @create_account_btn = 'btn_signup'
        @login_btn = 'btn_signin'
        @btn_enter = 'btnEnter'
        @email = 'etLogin'
        @password = 'etPassword'
        @profile_pic = 'profilePicture'
        @home_expected_text = 'Meu saldo'
        @pay_btn_menu = 'button_pagar'
        @fild_search = 'search_view'
        @contact = 'eliete.salgados'
        @text_title_label = 'text_title'
        @value_fild = 'transactionValue'
        @value_transaction = '100'
        @btn_pay_transaction = 'btnPay'
        @conf_passw_pay = 'authDefaultDialogPassword'
        @conf_pay = 'buttonFinishWithPassword'
        @text_transaction_ = 'text_transaction'
    end

    def wait_for_element(type, identificator, time)
        manage.timeouts.implicit_wait = (time)
        @driver.find_element(type, identificator).displayed?
        rescue StandardError
        raise 'Elemento não localizado'
    end

    def verify_home_not_logged
        wait_for_element(:id, @create_account_btn, 10)
    end

    def click_signin
        id(@login_btn).click
    end

    def insert_values_login(email, password)
        find_element(:id, @email).send_keys(email)
        find_element(:id, @password).send_keys(password)
    end

    def insert_credentials
        wait_for_element(:id, @btn_enter, 10)
        @user = CREDENTIALS['valid_user'.to_sym]
        insert_values_login(@user[:email], @user[:password])
    end

    def confirm_login
        id(@btn_enter).click
    end

    def expected_home
        wait_for_element(:id, @profile_pic, 10)
        text(@home_expected_text).displayed?
    end

    def pay
        wait_for_element(:id, @pay_btn_menu, 10)
        id(@pay_btn_menu).click
    end

    def select_contact
        wait_for_element(:id, @fild_search, 10)
        id(@fild_search).send_keys(@contact)
        wait_for_element(:id, @profile_pic, 10)
        find_elements(:id, @text_title_label)[4].click
    end

    def insert_value_pay
        wait_for_element(:id, @value_fild, 10)
        id(@value_fild).send_keys(@value_transaction)
        id(@btn_pay_transaction).click
    end

    def pay_contact
        pay
        select_contact
        insert_value_pay
    end

    def confirm_pay
        wait_for_element(:id, @conf_passw_pay, 10)
        id(@conf_passw_pay).send_keys(@user[:password])
        id(@conf_pay).click   
    end

    def expected_payed
        wait_for_element(:id, @text_transaction_, 15)
     end

end 