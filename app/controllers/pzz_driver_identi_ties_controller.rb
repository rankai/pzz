class PzzDriverIdentiTiesController < ApplicationController
  before_action :set_pzz_driver_identity, only: [:show, :edit, :update, :destroy]

  # GET /pzz_driver_identities
  # GET /pzz_driver_identities.json
  def index
    @pzz_driver_identities = PzzDriverIdentity.all
  end

  # GET /pzz_driver_identities/1
  # GET /pzz_driver_identities/1.json
  def show
  end

  # GET /pzz_driver_identities/new
  def new
    @pzz_driver_identity = PzzDriverIdentity.new
  end

  # GET /pzz_driver_identities/1/edit
  def edit
  end

  # POST /pzz_driver_identities
  # POST /pzz_driver_identities.json
  def create
    @pzz_driver_identity = PzzDriverIdentity.new(pzz_driver_identity_params)

    respond_to do |format|
      if @pzz_driver_identity.save
        format.html { redirect_to @pzz_driver_identity, notice: 'Pzz driver identity was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_driver_identity }
      else
        format.html { render :new }
        format.json { render json: @pzz_driver_identity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_driver_identities/1
  # PATCH/PUT /pzz_driver_identities/1.json
  def update
    respond_to do |format|
      if @pzz_driver_identity.update(pzz_driver_identity_params)
        format.html { redirect_to @pzz_driver_identity, notice: 'Pzz driver identity was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_driver_identity }
      else
        format.html { render :edit }
        format.json { render json: @pzz_driver_identity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_driver_identities/1
  # DELETE /pzz_driver_identities/1.json
  def destroy
    @pzz_driver_identity.destroy
    respond_to do |format|
      format.html { redirect_to pzz_driver_identities_url, notice: 'Pzz driver identity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_driver_identity
      @pzz_driver_identity = PzzDriverIdentity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_driver_identity_params
      params.require(:pzz_driver_identity).permit(:pzz_user_id, :user_realname, :identity_dl_no, :identity_dl_image, :identity_dl_type, :identity_dl_issued, :identity_dl_status, :identity_status, :indentity_remark)
    end
end
