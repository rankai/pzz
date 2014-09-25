class PzzLinksController < ApplicationController
  before_action :set_pzz_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_links
  # GET /pzz_links.json
  def index
    @pzz_links = PzzLink.all
  end

  # GET /pzz_links/1
  # GET /pzz_links/1.json
  def show
  end

  # GET /pzz_links/new
  def new
    @pzz_link = PzzLink.new
  end

  # GET /pzz_links/1/edit
  def edit
  end

  # POST /pzz_links
  # POST /pzz_links.json
  def create
    @pzz_link = PzzLink.new(pzz_link_params)

    respond_to do |format|
      if @pzz_link.save
        format.html { redirect_to @pzz_link, notice: 'Pzz link was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_link }
      else
        format.html { render :new }
        format.json { render json: @pzz_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_links/1
  # PATCH/PUT /pzz_links/1.json
  def update
    respond_to do |format|
      if @pzz_link.update(pzz_link_params)
        format.html { redirect_to @pzz_link, notice: 'Pzz link was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_link }
      else
        format.html { render :edit }
        format.json { render json: @pzz_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_links/1
  # DELETE /pzz_links/1.json
  def destroy
    @pzz_link.destroy
    respond_to do |format|
      format.html { redirect_to pzz_links_url, notice: 'Pzz link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_link
      @pzz_link = PzzLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_link_params
      params.require(:pzz_link).permit(:pzz_user_id, :link_url, :link_name, :link_image, :link_target, :link_description, :link_visible, :link_rating, :link_rel, :link_notes, :link_rss)
    end
end
