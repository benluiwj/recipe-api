class IngredientsController < ApplicationController
	def index
	end

	def show
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
