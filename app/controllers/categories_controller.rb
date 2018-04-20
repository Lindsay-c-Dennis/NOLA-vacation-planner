class CategoriesController < ApplicationController
	before_action :find_category, only: [:edit, :update, :show]

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
	end 
	
	def update 
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
		@landmarks = @category.landmarks
	end

	private

	def category_params 
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find_by(id: params[:id])
	end	

end
