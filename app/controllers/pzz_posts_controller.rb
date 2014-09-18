class PzzPostsController < ApplicationController
  before_action :set_pzz_post, only: [:show, :edit, :update, :destroy]

  # GET /pzz_posts
  # GET /pzz_posts.json
  def index
    @pzz_posts = PzzPost.all
  end

  # GET /pzz_posts/1
  # GET /pzz_posts/1.json
  def show
  end

  # GET /pzz_posts/new
  def new
    @pzz_post = PzzPost.new
  end

  # GET /pzz_posts/1/edit
  def edit
  end

  # POST /pzz_posts
  # POST /pzz_posts.json
  def create
    @pzz_post = PzzPost.new(pzz_post_params)

    respond_to do |format|
      if @pzz_post.save
        format.html { redirect_to @pzz_post, notice: 'Pzz post was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_post }
      else
        format.html { render :new }
        format.json { render json: @pzz_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_posts/1
  # PATCH/PUT /pzz_posts/1.json
  def update
    respond_to do |format|
      if @pzz_post.update(pzz_post_params)
        format.html { redirect_to @pzz_post, notice: 'Pzz post was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_post }
      else
        format.html { render :edit }
        format.json { render json: @pzz_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_posts/1
  # DELETE /pzz_posts/1.json
  def destroy
    @pzz_post.destroy
    respond_to do |format|
      format.html { redirect_to pzz_posts_url, notice: 'Pzz post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_post
      @pzz_post = PzzPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_post_params
      params.require(:pzz_post).permit(:pzz_user_id, :post_title, :post_name, :post_content, :post_excerpt, :post_status, :comment_status, :post_content_filtered, :comment_count, :post_order, :post_guid, :to_ping, :pinged, :ping_status)
    end
end
