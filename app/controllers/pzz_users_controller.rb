class PzzUsersController < ApplicationController
  
  before_action :set_pzz_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_pzz_user!


  def_param_group :kaminari do
    param :page, String, :desc => "第几页", :required => false
    param :per_page, String, :desc => "每页路线条数", :required => false
  end

  # GET /pzz_users
  # GET /pzz_users.json
  api :GET, '/pzz_users', "批量获取用户"
  api :GET, '/pzz_users.json', "批量获取用户（JSON）"
  param_group :kaminari
  def index
    @pzz_users = PzzUser.page(params[:page]).per(params[:per_page]).
    order(created_at: :desc)

    respond_to do |format|
      format.html { super }
      format.json {
        render json: @pzz_users.to_json(only: [:id, :email, :user_nickname, 
          :user_description, :user_avatar], methods: [:user_avatar_url])
      }
    end
  end

  # GET /pzz_users/1
  # GET /pzz_users/1.json
  api :GET, '/pzz_users/:id', "根据ID获取指定的用户"
  api :GET, '/pzz_users/:id.json', "根据ID获取指定的用户（JSON）"
  def show
    respond_to do |format|
      format.json {
        render json: JSON::parse(@pzz_user.to_json).merge("avatar_urls" => { "orignal" => @pzz_user.user_avatar.url, 
          "medium" => @pzz_user.user_avatar.url(:medium), "thumb" => @pzz_user.user_avatar.url(:thumb) }).to_json 
      }
    end
  end


  # set avatar
  api :post, "/pzz_users/avatar", "设定用户头像"
  def avatar
    respond_to do |format|
      format.json {
        resource = PzzUser.find_by(authentication_token: params[:auth_token])
        if resource.nil?
          head :not_found 
        else
          if resource.update_attributes(user_avatar: params[:user_avatar])
            resource.crop_avatar(resource, params[:x], params[:y], params[:w], params[:h])
            render :status => 200, :json => resource
          else
            head :internal_error
          end
          
        end
      }
    end
  end



  private


  # Use callbacks to share common setup or constraints between actions.
  def set_pzz_user
    @pzz_user = PzzUser.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def pzz_user_params
    params.require(:pzz_user).permit(:user_nickname, :user_avatar, :user_phone,  
    :email, :password, :password_confirmation, :user_description, :user_status, 
    :user_display_name, :user_age, :user_contact_prefer, :user_qq)
  end

end
