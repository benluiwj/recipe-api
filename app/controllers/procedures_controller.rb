class ProceduresController < ApplicationController
	def index
		if all_procedures
			render json: all_procedures, status: :ok
		else
			render json: {message: "No procedures found"}, status: :not_found
		end
	end

	def show
		if procedure
			render json: procedure, status: :ok
		else
			render json: procedure.errors, status: :not_found
		end
	end

	def create		
		procedure = Procedure.new(procedure_params)
		if procedure.save
			render json: procedure, status: :created
		
		else
			render json: {errors: procedure.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		unless procedure.update(procedure_params)
			render json: {errors: procedure.errors.full_messages}, status: :unprocessable_entity
		end
		render json: {message: "Successfully updated"}, status: :ok
	end

	def destroy
		procedure.destroy
		render json: {message: "Successfully deleted!"}, status: :ok
	end

	private
	def procedure_params
		params.permit(:recipe_id, :id, :step_num, :procedure)
	end

	def all_procedures
		procedures = Procedure.references(params[:recipe_id])
	end

	def procedure
		@procedure = Procedure.references(params[:recipe_id]).find(params[:id])
	end

end
