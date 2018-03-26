class Users::UsersController < ApplicationController
	
	before_action :set_content_type ,:only => :create
	def index
		@user = User.offset(params[:offset]).limit(params[:limit]).order(created_at: :desc)
		render json: @user
	end

	def create

		@userx = User.where(id_fb: params[:id_fb])
		if @userx.empty?

			@user = User.new(user_params)
 	   			 if @user.save
  					render json: {'success' =>1, 'message' => 'berhasil', 'id' => @user[:id]},status: :ok
  				else 
  					render json: {'success' =>0, 'message' => @user.errors.full_messages},status: :ok
  				end
	
		else 

		render json: {'success' =>1, 'id' => @userx[0][:id_fb]}

		end

    
	end

	def cek_daftar
		@user = User.where(id_fb: params[:id_fb])
		if @user.empty?

			render json: {'success' =>0}
		else 
			render json: {'success' => 1, 'id_fb' =>@user[0]['id_fb']}
		end

		
	end
	
 
	private def user_params
    	params.permit(:no_ktp,:nama,:hp,:url_foto,:username,:status,:skpd,:id_fb,:token_fb)
 	 end


 	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end
 	

 
end
