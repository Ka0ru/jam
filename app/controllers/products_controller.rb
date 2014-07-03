class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
	  	@product = Product.new
	  	@ingredients = Ingredient.all
	end

	def create
		@ingredients = Ingredient.all
  		@product = Product.new(product_params)
  		p params['products_ingredients']
  		#@product.products_ingredients.build(params.require(:products_ingredients).permit(:nb_ingredient, :ingredient_id, :products_ingredients[:ingredient_ids]))
  		@product.save
  		params['products_ingredients'].each do |a|
  			i = ProductsIngredient.create(a.last.merge(:product_id => @product.id))
  			p i.errors
  		end

  		p @product.products_ingredients
  		p @product.ingredients

  		uploaded_io = params[:product][:photo]

  		if @product.save
			File.open(Rails.root.join('public', 'uploads', @product.id.to_s()+'.jpg'), 'wb') do |file|
				file.write(uploaded_io.read)
			end
  			redirect_to @product
  		else
  			p @product.errors
  			render "new"
  		end
	end

	def show
	  	@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
 	 	uploaded_io = params[:product][:photo]
		if @product.update_attributes(params[:product].permit(:name, :price, :margin, :description))
			File.open(Rails.root.join('public', 'uploads', @product.id.to_s()+'.jpg'), 'wb') do |file|
				file.write(uploaded_io.read)
			end
		  redirect_to products_url
		else
		  render "edit"
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_url
	end

	def upload
	  
	end

	private
	  	def product_params
	  		params.require(:product).permit(:name, :price, :margin, :description, :products_ingredients => [:nb_ingredient, :ingredient_id])
	  	end
end

