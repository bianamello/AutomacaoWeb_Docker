#language:pt

Funcionalidade: Comprar pelo Site
    
    Para que eu possa realizar a compra de um item pelo site
    Sendo um cliente que possui cadastro
    Posso selecionar um método de pagamento e finalizar o meu pedido 

Cenário: Comprar um item no site

    Dado que eu seleciono um item para meu carrinho        
    E possuo um cadastro no site
    Quando confirmo meus dados de entrega e forma de pagamento
    Então uma ordem de compra é emitida