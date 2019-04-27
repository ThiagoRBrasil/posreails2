class ApplicationController < ActionController::API

	def index
		render json: Picture.all.map(&:image_url)	
	end
	
end
