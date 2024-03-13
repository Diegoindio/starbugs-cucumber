# importando camada Page Objects dentro desse arquivo hooks.rb
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/order.rb'
require_relative './pages/components.rb'
Before do
# Instancioando essa classe dentro do projeto cucumber. Tendo acesso a home dentro de qualquer camada de steps.
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @order = OrderPage.new
    @popup = Popup.new   
end

After do |scenario|

     screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
     attach(screenshot, "image/png" , "Screenshot" )

    # if(scenario.failed?)
    #     screenshot = page.save_screenshot("logs/screenshots/temp.png")
    #     attach(screenshot, "image/png" , "Screenshot" )
    # end   
end