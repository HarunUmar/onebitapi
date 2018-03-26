class Gambarpost < ApplicationRecord
  belongs_to :post 
  has_attached_file :picture, styles: { large:"1280x1280#",medium: "700x700#", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment :picture, presence: true
  do_not_validate_attachment_file_type :picture
 


 def url 
 	 picture.url(:thumb)
 end
end