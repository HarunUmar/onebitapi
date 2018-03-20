class Post < ApplicationRecord
	belongs_to :user
	has_many :commentposts
	has_many :loveposts
	has_many :gambarposts, :dependent => :destroy
	attr_accessor :picture
	validates_presence_of :isi,:lat,:lng,:message => 'masih kosong'



def save_img(params)
	params.each { |img|
 	    		self.gambarposts.create(:picture => img)}
end

	def img_url
 		#self.inspect
 		Gambarpost.find(16).picture_medium
 	end

 




end
