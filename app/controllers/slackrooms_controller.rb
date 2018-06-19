class SlackroomsController < ApplicationController
  before_action :set_slackroom, only: [:show, :edit, :update, :destroy]

  # GET /slackrooms
  # GET /slackrooms.json
  def index
    @slackrooms = Slackroom.all
  end

  # GET /slackrooms/1
  # GET /slackrooms/1.json
  def show
    @messages = @slackroom.messages.order(created_at: :desc).limit(100).reverse
  end

  # GET /slackrooms/new
  def new
    @slackroom = Slackroom.new
  end

  # GET /slackrooms/1/edit
  def edit
  end

  # POST /slackrooms
  # POST /slackrooms.json
  def create
    @slackroom = Slackroom.new(slackroom_params)

    respond_to do |format|
      if @slackroom.save

        @slackroom.slackroom_users.where(user_id: current_user.id).first_or_create

        format.html { redirect_to @slackroom, notice: 'Slackroom was successfully created.' }
        format.json { render :show, status: :created, location: @slackroom }
      else
        format.html { render :new }
        format.json { render json: @slackroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slackrooms/1
  # PATCH/PUT /slackrooms/1.json
  def update
    respond_to do |format|
      if @slackroom.update(slackroom_params)
        format.html { redirect_to @slackroom, notice: 'Slackroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @slackroom }
      else
        format.html { render :edit }
        format.json { render json: @slackroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slackrooms/1
  # DELETE /slackrooms/1.json
  def destroy
    @slackroom.destroy
    respond_to do |format|
      format.html { redirect_to slackrooms_url, notice: 'Slackroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slackroom
      @slackroom = Slackroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slackroom_params
      params.require(:slackroom).permit(:name)
    end
end
