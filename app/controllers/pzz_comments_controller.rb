class PzzCommenTsController < ApplicationController
  before_action :set_pzz_comment, only: [:show, :edit, :update, :destroy]

  # GET /pzz_comments
  # GET /pzz_comments.json
  def index
    @pzz_comments = PzzComment.all
  end

  # GET /pzz_comments/1
  # GET /pzz_comments/1.json
  def show
  end

  # GET /pzz_comments/new
  def new
    @pzz_comment = PzzComment.new
  end

  # GET /pzz_comments/1/edit
  def edit
  end

  # POST /pzz_comments
  # POST /pzz_comments.json
  def create
    @pzz_comment = PzzComment.new(pzz_comment_params)

    respond_to do |format|
      if @pzz_comment.save
        format.html { redirect_to @pzz_comment, notice: 'Pzz comment was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_comment }
      else
        format.html { render :new }
        format.json { render json: @pzz_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_comments/1
  # PATCH/PUT /pzz_comments/1.json
  def update
    respond_to do |format|
      if @pzz_comment.update(pzz_comment_params)
        format.html { redirect_to @pzz_comment, notice: 'Pzz comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_comment }
      else
        format.html { render :edit }
        format.json { render json: @pzz_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_comments/1
  # DELETE /pzz_comments/1.json
  def destroy
    @pzz_comment.destroy
    respond_to do |format|
      format.html { redirect_to pzz_comments_url, notice: 'Pzz comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_comment
      @pzz_comment = PzzComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_comment_params
      params.require(:pzz_comment).permit(:pzz_user_id, :pzz_post_id, :user_email, :user_url, :user_ip, :comment_content, :comment_approved, :user_agent, :comment_parent_id)
    end
end
