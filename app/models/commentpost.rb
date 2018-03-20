class Commentpost < ApplicationRecord

  belongs_to :user
  belongs_to :post
  validates_presence_of :user_id,:post_id,:isi, :message => 'masih kosong'


end
