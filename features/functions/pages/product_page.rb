class ProductPage < SitePrism::Page

    element :botao_adicionar, 'p[id="add_to_cart"] > button[type="submit"]'
    element :botao_checkout, 'a[class="btn btn-default button button-medium"'

end