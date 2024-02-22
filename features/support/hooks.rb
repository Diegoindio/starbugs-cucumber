# importando camada Page Objects dentro desse arquivo hooks.rb
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
Before do
# Instancioando essa classe dentro do projeto cucumber. Tendo acesso a home dentro de qualquer camada de steps.
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @popup = Popup.new
    
end