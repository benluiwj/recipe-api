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
	end

	def update
	end

	def destroy
	end

	private
	def ingredient_params
		params.permit(:name, :amount, :units)
	end

	def all_ingredients
		ingredients = Ingredient.references(params[:recipe_id])
	end

	def ingredient
		@ingredient = Ingredient.references(params[:recipe_id]).find(params[:id])
	end
end
