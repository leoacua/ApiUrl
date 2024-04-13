module Api
  class EarthquakesController < ApplicationController

    def index_with_comments
      earthquakes_with_comments = Earthquake.includes(:comments).all
      render json: earthquakes_with_comments, include: :comments, status: :ok
    end

    # GET /api/earthquakes
    def index
      earthquakes = Earthquake.all
      render json: earthquakes
    end

    # GET /api/earthquakes/:id
        def show
          earthquake = Earthquake.includes(:comments).find_by(id: params[:id])
      
      if earthquake
        render json: earthquake,include: :comments, status: :ok
      else
        render json: { error: "Terremoto no encontrado" }, status: :not_found
      end
    end

    # POST /api/earthquakes
    def create
      earthquake = Earthquake.new(earthquake_params)
      if earthquake.save
        render json: earthquake, status: :created
      else
        render json: earthquake.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/earthquakes/:id
    def update
      earthquake = Earthquake.find(params[:id])
      if earthquake.update(earthquake_params)
        render json: earthquake
      else
        render json: earthquake.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/earthquakes/:id
    def destroy
      earthquake = Earthquake.find(params[:id])
      earthquake.destroy
      head :no_content
    end

    private

    def earthquake_params
      params.require(:earthquake).permit(:magnitude, :place, :time, :url, :tsunami, :mag_type, :title, :longitude, :latitude)
    end
  end
end
