class IngredientsController < ApplicationController
	def index
		if all_ingredients
			render json: all_ingredients, status: :ok
		else
			render json: {message: "No recipe found"}, status: :not_found
		end
	end

	def show
		if ingredient
			render json: ingredient, status: :ok
		else
			render json: ingredient.errors, status: :not_found
		end
	end

	def create		
		ingredient = Ingredient.new(ingredient_params)
		if ingredient.save
			render json: ingredient, status: :created
		
		else
			render json: {errors: ingredient.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		unless ingredient.update(ingredient_params)
			render json: {errors: ingredient.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		ingredient.destroy
		render json: {message: "Successfully deleted!"}, status: :ok
	end

	private
	def ingredient_params
		params.permit(:recipe_id, :id, :name, :amount, :units)
	end

	def all_ingredients
		ingredients = Ingredient.references(params[:recipe_id])
	end

	def ingredient
		@ingredient = Ingredient.references(params[:recipe_id]).find(params[:id])
	end
end
