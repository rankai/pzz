class PzzTemplatesController < ApplicationController
  before_action :set_pzz_template, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_templates
  # GET /pzz_templates.json
  def index
    @pzz_templates = PzzTemplate.all
  end

  # GET /pzz_templates/1
  # GET /pzz_templates/1.json
  def show
  end

  # GET /pzz_templates/new
  def new
    @pzz_template = PzzTemplate.new
  end

  # GET /pzz_templates/1/edit
  def edit
  end

  # POST /pzz_templates
  # POST /pzz_templates.json
  def create
    @pzz_template = PzzTemplate.new(pzz_template_params)

    respond_to do |format|
      if @pzz_template.save
        format.html { redirect_to @pzz_template, notice: 'Pzz template was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_template }
      else
        format.html { render :new }
        format.json { render json: @pzz_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_templates/1
  # PATCH/PUT /pzz_templates/1.json
  def update
    respond_to do |format|
      if @pzz_template.update(pzz_template_params)
        format.html { redirect_to @pzz_template, notice: 'Pzz template was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_template }
      else
        format.html { render :edit }
        format.json { render json: @pzz_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_templates/1
  # DELETE /pzz_templates/1.json
  def destroy
    @pzz_template.destroy
    respond_to do |format|
      format.html { redirect_to pzz_templates_url, notice: 'Pzz template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_template
      @pzz_template = PzzTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_template_params
      params.require(:pzz_template).permit(:template_key, :template_value, :template_type)
    end
end
