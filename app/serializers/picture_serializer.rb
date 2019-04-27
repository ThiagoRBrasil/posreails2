class PictureSerializer < ActiveModel::PictureSerializer
	arributes :id, :name, :image_url

	def image_url
		ser.object.image_url
	end
end