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

  		p @product.products_ingredients
  		p @product.ingredients
  		@quantity = ProductsIngredient.new(ingredient_nb)

  		uploaded_io = params[:product][:photo]
		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
			file.write(uploaded_io.read)
		end

  		if @product.save
  			@quantity.save
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
		if @product.update_attributes(params[:product].permit(:name, params[:id], :price, :margin, :description))
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
	  		params.require(:product).permit(:name, :photo, :price, :margin, :description, :nb_ingredient, :ingredient_ids => [])
	  	end
end

