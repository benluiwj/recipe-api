class RecipesController < ApplicationController
	# /recipes
	def index
		recipe = Recipe.references(user_id: session_user.id)
		render json: recipe, status: :ok
	end

	def show
		if recipe
			render json: recipe, status: :ok
		else
			render json: recipe.errors, status: :not_found
		end
	end

	def create
		@recipe = recipe.new(recipe_params)
		if @recipe.save
			render json: @recipe, status: :created
		
		else
			render json: {erros: @recipe.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		unless @recipe.update(recipe_params)
			render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@recipe.destroy
		render json: { message: 'Recipe deleted!' }, status: :ok
	end

	private 

	def recipe_params
		params.permit(:image, :name, :source_url, :category, :serving_size, :prep_time, :cook_time, :yield, :notes)
	end

	def recipe
		@recipe = Recipe.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Recipe not found' }, status: :not_found
	end
end
