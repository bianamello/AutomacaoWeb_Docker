class AuthenticationPage < SitePrism::Page

    element :title_Mr, 'div[id="uniform-id_gender1"]'
    element :title_Mrs, 'input[id="id_gender2"]'
    element :input_firstname, '#customer_firstname'
    element :input_lastname, '#customer_lastname'
    element :input_email, '#email'
    element :input_password, '#passwd'
    element :select_dia, '#uniform-days'
    element :option_dia, '#days > option[value="8"]'
    element :select_mes, '#uniform-months'
    element :option_mes, '#months > option[value="1"]'
    element :select_ano, '#uniform-years'
    element :option_ano, '#years > option[value="1987"]'
    element :input_address, '#address1'
    element :input_city, '#city'
    element :select_state, '#uniform-id_state' 
    element :option_state, '#id_state > option[value="5"]'
    element :input_postalCode, '#postcode'
    element :select_country, '#uniform-id_country'
    element :option_country, '#id_country > option[value="21"]'
    element :input_phoneMobile, '#phone_mobile'
    element :botao_registrar, 'button[id="submitAccount"]'

    
    def gerarDadosParaCadastro
        email =  Faker::Internet.email            #0
        fisrtName = Faker::Name.first_name        #1
        lastName = Faker::Name.last_name          #2
        password = Faker::Internet.password       #3
        address = Faker::Address.street_address   #4
        city = Faker::Address.city                #5
        postalCode = Faker::Number.number(5)      #6
        mobilePhone = Faker::Number.number(11)    #7  

        dados = [email, fisrtName, lastName, password, address, city, postalCode, mobilePhone]
    end    

    def registrarConta(fisrtName, lastName, email, password, address, city, postalCode, mobilePhone)
        title_Mr.click
        input_firstname.set fisrtName
        input_lastname.set lastName
        input_email.set email
        input_password.set password
        select_dia.click
        option_dia.click
        select_mes.click
        option_mes.click
        select_ano.click
        option_ano.click
        input_address.set address
        input_city.set city
        select_state.click
        option_state.click
        input_postalCode.set postalCode
        select_country.click
        option_country.click
        input_phoneMobile.set mobilePhone
        botao_registrar.click
    end

end