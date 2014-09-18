class PzzIdentiTiesController < ApplicationController
  before_action :set_pzz_identity, only: [:show, :edit, :update, :destroy]

  # GET /pzz_identities
  # GET /pzz_identities.json
  def index
    @pzz_identities = PzzIdentity.all
  end

  # GET /pzz_identities/1
  # GET /pzz_identities/1.json
  def show
  end

  # GET /pzz_identities/new
  def new
    @pzz_identity = PzzIdentity.new
  end

  # GET /pzz_identities/1/edit
  def edit
  end

  # POST /pzz_identities
  # POST /pzz_identities.json
  def create
    @pzz_identity = PzzIdentity.new(pzz_identity_params)

    respond_to do |format|
      if @pzz_identity.save
        format.html { redirect_to @pzz_identity, notice: 'Pzz identity was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_identity }
      else
        format.html { render :new }
        format.json { render json: @pzz_identity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_identities/1
  # PATCH/PUT /pzz_identities/1.json
  def update
    respond_to do |format|
      if @pzz_identity.update(pzz_identity_params)
        format.html { redirect_to @pzz_identity, notice: 'Pzz identity was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_identity }
      else
        format.html { render :edit }
        format.json { render json: @pzz_identity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_identities/1
  # DELETE /pzz_identities/1.json
  def destroy
    @pzz_identity.destroy
    respond_to do |format|
      format.html { redirect_to pzz_identities_url, notice: 'Pzz identity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_identity
      @pzz_identity = PzzIdentity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_identity_params
      params.require(:pzz_identity).permit(:pzz_user_id, :user_realname, :user_gender, :identity_card_no, :identity_image, :identity_status, :identity_remark)
    end
end
