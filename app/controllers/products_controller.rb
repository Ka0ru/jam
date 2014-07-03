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

  # 		uploaded_io = params[:product][:photo]
		# File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
		# 	file.write(uploaded_io.read)
		# end

  		if @product.save
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
	  		params.require(:product).permit(:name, :price, :margin, :description, :products_ingredients => [:nb_ingredient, :ingredient_id])
	  	end
end

