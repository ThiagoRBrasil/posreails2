class PictureSerializer < ActiveModel::Serializer
	attributes :id, :nome, :imagem

	def nome
		self.object.name		
	end

	def imagem
		self.object.image_url
	end
end