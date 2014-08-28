class ProvisioningsController < ApplicationController
  before_action :set_provisioning, only: [:show, :edit, :update, :destroy]
  before_action :set_roles, only: [:new, :create, :edit, :update]

  # GET /provisionings
  # GET /provisionings.json
  def index
    @provisionings = Provisioning.all
  end

  # GET /provisionings/1
  # GET /provisionings/1.json
  def show
  end

  # GET /provisionings/new
  def new
    @provisioning = Provisioning.new
  end

  # GET /provisionings/1/edit
  def edit
  end

  # POST /provisionings
  # POST /provisionings.json
  def create
    @provisioning = Provisioning.new(provisioning_params)

    respond_to do |format|
      if @provisioning.save
        format.html { redirect_to @provisioning, notice: 'Provisioning was successfully created.' }
        format.json { render :show, status: :created, location: @provisioning }
      else
        format.html { render :new }
        format.json { render json: @provisioning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provisionings/1
  # PATCH/PUT /provisionings/1.json
  def update
    respond_to do |format|
      if @provisioning.update(provisioning_params)
        format.html { redirect_to @provisioning, notice: 'Provisioning was successfully updated.' }
        format.json { render :show, status: :ok, location: @provisioning }
      else
        format.html { render :edit }
        format.json { render json: @provisioning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provisionings/1
  # DELETE /provisionings/1.json
  def destroy
    @provisioning.destroy
    respond_to do |format|
      format.html { redirect_to provisionings_url, notice: 'Provisioning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provisioning
      @provisioning = Provisioning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provisioning_params
      params.require(:provisioning).permit(:role_ids)
    end
end
