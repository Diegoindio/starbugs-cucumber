Quando('acesso a página principal da Starbugs') do
    @home.open
    # visit 'https://starbugs.vercel.app/'
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    # products = all('.coffee-item')
    expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página inicial da Starbugs') do
    @home.open
    # visit 'https://starbugs.vercel.app/'
  end

Dado('que desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash
    # puts table.rows_hash
    # @product_name = table.hashes[0][:product]
    # @product_price = table.hashes[0][:price]
    # @delivery_price = table.hashes[0][:delivery]
end

/Dado('que desejo comprar o café {string}') do |product_name|
     @product_name = product_name
end
  
Dado('que esse produto custa {string}') do |product_price|
    @product_price = product_price
end
  
Dado('que o custo de entrega é de {string}') do |delivery_price|
    @delivery_price = delivery_price
end
*/
Quando('inicio a compra desse item') do
    @home.buy(@product[:name])
    # product = find('.coffee-item', text: @product[:name])
    # product.find('.buy-coffee').click
end

Então('devo ver a página de Checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
end

Então('o valor totoal da compra deve ser de {string}') do |total_price|
   @checkout.assert_total_price(total_price)
end

Então('devo ver um popup informando que o produto está indisponível') do
    @popup.have_text('Produto indisponível')
end