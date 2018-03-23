class PostSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 include ActionView::Helpers::DateHelper
 attributes :id, :user_id,:isi, :lat, :lng, :jenis, :comment_count, :love_count, :img_count, :waktu
 has_many :loveposts, if: ->{:renderlove}
 belongs_to :user , if:-> {:renderuser}
 has_many :commentposts, if: ->{:rendercommantpost}
 has_many :gambarposts
 

  def renderuser
  @instance_options[:adduser]
  end

  def rendercommantpost
  	@instance_options[:addcommentpost]
  	
  end

  def renderlove
    false
  end

  def comment_count
  	object.commentposts.length
  end

  def love_count
    object.loveposts.length
  end

  def img_count
    object.gambarposts.length
  end

  def waktu
    time_ago_in_words(object.created_at)
  end




end
