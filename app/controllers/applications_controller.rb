class ApplicationsController < ApplicationController
  respond_to :html, :xml, :json

  before_action :set_application, only: [:show, :edit, :update, :destroy]
  #Requires Being Signed in to View the Following
  before_action :authenticate_user!, except:[:index, :show]
  #Enables CanCan's User settings
  before_action :get_sponsorship
  load_and_authorize_resource

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])
  end

  # GET /applications/new
  def new
    # @application = Application.new
    # respond_with(@application)
    @application = current_user.applications.build
  end

  # GET /applications/1/edit
  def edit
    @application = @sponsorship.applications.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    # @application = Application.create(application_params)

    @application = current_user.applications.build(application_params)
    @application.sponsorship_id = @sponsorship.id
    if @application.save
      redirect_to sponsorships_path, notice: 'Application created successfully'
    else
      render 'user/application'
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    @application = @sponsorship.applications.find(params[:id])
    if @application.update_attributes(application_params)
      respond_to do |format|
      format.html { redirect_to sponsorship_applications_path, notice: "Application was successfully Sponsi'd" }
    end
    else
      render 'edit'
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to sponsorship_applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_sponsorship
      @sponsorship = Sponsorship.find(params[:sponsorship_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:name, :sport, :rank)
    end
end
