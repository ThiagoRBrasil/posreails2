class Api::V1::PicturesController < ApplicationController
	def create
		picture = Picture.create create_picture_params

		if picture.valid?
			render json: picture, status: :created, serializer: PictureSerializer
		else
			render json: {error: picture.errors}, status: :unprocessable_entity
		end
	end

	def update
		picture = Picture.find_by_id update_picture_params[:id]
		if picture
			picture.image.attach update_picture_params[:image] if update_picture_params[:image]
			picture.name = update_picture_params[:name]
			if picture.update update_picture_params
				render json: picture, status: :ok, serializer: PictureSerializer
			else
				render json: {error: picture.errors}, status: :unprocessable_entity				
			end
		else
			render json: {message: "not found"}, status: :not_found
		end
	end

	def index
		render json: Picture.all, each_serializer: PictureSerializer
	end

	private

	def create_picture_params
		params.permit(:name, :image) 
	end

	def update_picture_params
		params.permit(:id, :name, :image) 
	end
end
