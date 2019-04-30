class HomePage < SitePrism::Page

    set_url 'http://www.automationpractice.com/'

    element :nome_item, 'div > div.right-block > h5 > a[href*="id_product=4&controller=product"]'
    
end