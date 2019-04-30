class OrderPage < SitePrism::Page

    element :nome_item, 'p[class="product-name"] > a'
    element :botao_checkout,'a[href="http://automationpractice.com/index.php?controller=order&step=1"]'
    element :input_email, '#email_create'
    element :botao_criarConta, 'button[id="SubmitCreate"]'
    element :botao_confirmaEndereco, 'button[name="processAddress"]'
    element :agree_terms , 'div[id="uniform-cgv"] > span'
    element :botao_processarCompra, 'button[name="processCarrier"]'
    element :unit_preco, 'span[class="price"] > span[class="price"]'
    element :quantidade, 'td[class="cart_quantity text-center"] > span'
    element :frete, '#total_shipping'
    element :total, '#total_price'
    element :pagar_bank, 'a[class="bankwire"]'
    element :pagar_check, 'a[class="cheque"]'
    element :botao_confirmaOrdem, 'button[class*="button-medium"]'
    element :mensagem_confirmacao, 'p[class="alert alert-success"]'


    def criarConta(email)
        input_email.set email
        botao_criarConta.click
    end

    def confirmarEndereco
        botao_confirmaEndereco.click
    end

    def aceitaTermos
        agree_terms.click
        botao_processarCompra.click
    end

    def calculaValorTotal
        preco = ((self.unit_preco.text).tr('$', '')).to_f
        quantidade = (self.quantidade.text).to_i
        frete = ((self.frete.text).tr('$', '')).to_f
        total = (preco * quantidade) + frete
    end

end