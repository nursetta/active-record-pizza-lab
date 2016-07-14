class PizzaShop < Sinatra::Base
require 'json'	
	#INDEX METHOD
	get '/pizza' do 
		@pizza = Pizza.all
		@pizza.to_json
	end

	#SHOW METHOD
	get '/pizza/:id' do
		@pizza = Pizza.find(params[:id]).to_json
		@pizza
		p @pizza 
	end

	#CREATE METHOD
	post '/pizza' do
		new_pizza = JSON.parse request.body.read
		@pizza = Pizza.new(new_pizza)
		@pizza.save
	end
	
	#UPDATE METHOD
	put '/pizza/:id' do
		pizza_to_update = JSON.parse request.body.read
		@pizza = Pizza.find(params[:id])
		@pizza.update_attributes(pizza_to_update)
	end

	delete '/pizza/:id' do
	@pizza = Pizza.find(params[:id])
	@pizza.destroy
	end

end
