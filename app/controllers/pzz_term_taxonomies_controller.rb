class PzzTermTaxonomiesController < ApplicationController
  before_action :set_pzz_term_taxonomy, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_term_taxonomies
  # GET /pzz_term_taxonomies.json
  def index
    @pzz_term_taxonomies = PzzTermTaxonomy.all
  end

  # GET /pzz_term_taxonomies/1
  # GET /pzz_term_taxonomies/1.json
  def show
  end

  # GET /pzz_term_taxonomies/new
  def new
    @pzz_term_taxonomy = PzzTermTaxonomy.new
  end

  # GET /pzz_term_taxonomies/1/edit
  def edit
  end

  # POST /pzz_term_taxonomies
  # POST /pzz_term_taxonomies.json
  def create
    @pzz_term_taxonomy = PzzTermTaxonomy.new(pzz_term_taxonomy_params)

    respond_to do |format|
      if @pzz_term_taxonomy.save
        format.html { redirect_to @pzz_term_taxonomy, notice: 'Pzz term taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_term_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @pzz_term_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_term_taxonomies/1
  # PATCH/PUT /pzz_term_taxonomies/1.json
  def update
    respond_to do |format|
      if @pzz_term_taxonomy.update(pzz_term_taxonomy_params)
        format.html { redirect_to @pzz_term_taxonomy, notice: 'Pzz term taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_term_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @pzz_term_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_term_taxonomies/1
  # DELETE /pzz_term_taxonomies/1.json
  def destroy
    @pzz_term_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to pzz_term_taxonomies_url, notice: 'Pzz term taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_term_taxonomy
      @pzz_term_taxonomy = PzzTermTaxonomy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_term_taxonomy_params
      params.require(:pzz_term_taxonomy).permit(:term_id, :taxonomy_name, :taxonomy_description, :taxonomy_parent_id, :count)
    end
end
