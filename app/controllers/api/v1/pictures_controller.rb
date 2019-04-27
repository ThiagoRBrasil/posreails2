class Api::V1::PicturesController < ApplicationController
	def create
		picture = Picture.new create_picture_params
		picture.image.attach create_picture_params[:image] if create_picture_params[:image]
		
		binding.pry

		if picture.save
			render json: picture, status: :created
		else
			render json: {error: picture.errors}, status: :unprocessable_entity
		end
	end

	def index
		render json: Picture.all.map(&:image_url)	
	end

	private

	def create_picture_params
		params.permit(:name, :image)
	end
end
