class ScientistsController < ApplicationController

    
    def index 
        render json: Scientist.all 
    end

    def show
        scientist = find_scientist
        render json: scientist, serializer: ScientistWithPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created 
    end

    def update 
        Scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = find_scientist
        scientist.destroy
        head :no_content
    end

    private 

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end


end
