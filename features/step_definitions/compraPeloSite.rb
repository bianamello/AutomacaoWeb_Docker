Dado("que eu seleciono um item para meu carrinho") do 
  @home.load  
  @item = (@home.nome_item.text)
  @home.nome_item.click  
  @product.botao_adicionar.click
  screenshot("ItemCarrinho")
  @product.botao_checkout.click
  expect(@order.nome_item.text).to eql @item
  @order.botao_checkout.click
end

Dado("possuo um cadastro no site") do
  cadastro = @authentication.gerarDadosParaCadastro
  @order.criarConta(cadastro[0])
  @authentication.registrarConta(cadastro[1], cadastro[2], cadastro[0], cadastro[3], cadastro[4], cadastro[5], cadastro[6], cadastro[7])
end

Quando("confirmo meus dados de entrega e forma de pagamento") do
  @order.confirmarEndereco
  @order.aceitaTermos
  total = @order.calculaValorTotal
  expect(total).to eql ((@order.total.text).tr('$', '').to_f)
  @order.pagar_check.click
end

Então("uma ordem de compra é emitida") do
  @order.botao_confirmaOrdem.click
  expect(@order.mensagem_confirmacao.text).to eql 'Your order on My Store is complete.'
  screenshot("Confirmacao")
end
  