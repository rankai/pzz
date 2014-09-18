class PzzOptionsController < ApplicationController
  before_action :set_pzz_option, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_options
  # GET /pzz_options.json
  def index
    @pzz_options = PzzOption.all
  end

  # GET /pzz_options/1
  # GET /pzz_options/1.json
  def show
  end

  # GET /pzz_options/new
  def new
    @pzz_option = PzzOption.new
  end

  # GET /pzz_options/1/edit
  def edit
  end

  # POST /pzz_options
  # POST /pzz_options.json
  def create
    @pzz_option = PzzOption.new(pzz_option_params)

    respond_to do |format|
      if @pzz_option.save
        format.html { redirect_to @pzz_option, notice: 'Pzz option was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_option }
      else
        format.html { render :new }
        format.json { render json: @pzz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_options/1
  # PATCH/PUT /pzz_options/1.json
  def update
    respond_to do |format|
      if @pzz_option.update(pzz_option_params)
        format.html { redirect_to @pzz_option, notice: 'Pzz option was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_option }
      else
        format.html { render :edit }
        format.json { render json: @pzz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_options/1
  # DELETE /pzz_options/1.json
  def destroy
    @pzz_option.destroy
    respond_to do |format|
      format.html { redirect_to pzz_options_url, notice: 'Pzz option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_option
      @pzz_option = PzzOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_option_params
      params.require(:pzz_option).permit(:option_name, :option_value, :autoload)
    end
end
