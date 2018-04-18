class CategoriesController < ApplicationController

	def new
		@category = Category.new 
	end 

	def create
		@category = Category.new(category_params)
		if @category.save 
			redirect_to category_path(@category)
		else 
			render 'new'
		end
	end			

	
	def edit 
		@category = Category.find_by(id: params[:id])
	end 
	
	def update 
		@category = Category.find_by(id: params[:id])
		if @category.update(category_params)
			redirect_to category_path(@category)
		else 
			render 'edit'
		end 
	end					

	def index
		@categories = Category.all
	end
	
	def show
		@category = Category.find_by(id: params[:id])
	end

	private

	def category_params 
		params.require(:category).permit(:name)
	end

end
