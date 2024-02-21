Quando('acesso a página principal da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    expect(products.size).to be > 0
end

Dado('que estou na página inicial da Starbugs') do
    visit 'https://starbugs.vercel.app/'
  end
  
Dado('que desejo comprar o café {string}') do |product_name|
     @product_name = product_name
end
  
Dado('que esse produto custa {string}') do |product_price|
    @product_price = product_price
end
  
Dado('que o custo de entrega é de {string}') do |delivery_price|
    @delivery_price = delivery_price
end

Quando('inicio a compra desse item') do
    product = find('.coffee-item', text: @product_name)
    product.find('.buy-coffee').click
end

Então('devo ver a página de Checkout com os detalhes do produto') do
    product_title = find('.item-details h1')
    expect(product_title.text).to eql @product_name

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql @product_price

    delivery = find('.delivery-price')
    expect(delivery.text).to eql @delivery_price
end

Então('o valor totoal da compra deve ser de {string}') do |total_price|
   price = find('.total-price')
   expect(price.text).to eql total_price
end

Entao('devo ver um popup informando que o produto está indisponível') do
    popup = find('.swal2-html-container')
    expect(popup.text).to eql 'Produto indisponível'
end