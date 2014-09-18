class PzzMessagesController < ApplicationController
  before_action :set_pzz_message, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_messages
  # GET /pzz_messages.json
  def index
    @pzz_messages = PzzMessage.all
  end

  # GET /pzz_messages/1
  # GET /pzz_messages/1.json
  def show
  end

  # GET /pzz_messages/new
  def new
    @pzz_message = PzzMessage.new
  end

  # GET /pzz_messages/1/edit
  def edit
  end

  # POST /pzz_messages
  # POST /pzz_messages.json
  def create
    @pzz_message = PzzMessage.new(pzz_message_params)

    respond_to do |format|
      if @pzz_message.save
        format.html { redirect_to @pzz_message, notice: 'Pzz message was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_message }
      else
        format.html { render :new }
        format.json { render json: @pzz_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_messages/1
  # PATCH/PUT /pzz_messages/1.json
  def update
    respond_to do |format|
      if @pzz_message.update(pzz_message_params)
        format.html { redirect_to @pzz_message, notice: 'Pzz message was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_message }
      else
        format.html { render :edit }
        format.json { render json: @pzz_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_messages/1
  # DELETE /pzz_messages/1.json
  def destroy
    @pzz_message.destroy
    respond_to do |format|
      format.html { redirect_to pzz_messages_url, notice: 'Pzz message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_message
      @pzz_message = PzzMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_message_params
      params.require(:pzz_message).permit(:from_user_id, :to_user_id, :from_user_nickname, :message_subject, :message_content, :message_folder, :message_related_id, :message_status, :message_type)
    end
end
