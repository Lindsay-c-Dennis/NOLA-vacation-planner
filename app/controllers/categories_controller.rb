class CategoriesController < ApplicationController
	before_action :find_category, only: [:edit, :update, :show]

	def new
		@category = Category.new 
	end 

	def create
		@category = Category.new(category_params)
		#check to see if user input passes validations
		if @category.save 
			redirect_to category_path(@category)
		else 
			render 'new'
		end
	end			

	
	def edit 
	end 
	
	def update 
		#checks to see if user input for edit passes validations
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

	#defines acceptable params
	def category_params 
		params.require(:category).permit(:name)
	end

	#defines before_action for actions that require identifying a category by a dynamic id
	def find_category
		@category = Category.find_by(id: params[:id])
	end	

end
