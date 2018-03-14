class User < ApplicationRecord
	before_save :generate_hex
	
	def generate_hex
		self.hex_code = SecureRandom.hex
	end
end
