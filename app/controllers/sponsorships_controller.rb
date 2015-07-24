class SponsorshipsController < ApplicationController
  before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]
  # before_action :get_sponsorship
  respond_to :html

  def index
    @sponsorships = Sponsorship.all
    respond_with(@sponsorships)
  end

  def show
    @sponsorship = Sponsorship.find(params[:id])
    @application = @sponsorship.applications.build
    @current_user_sponsorships_applied_to = []
  end

  def new
    @sponsorship = Sponsorship.new
    @sponsorship.rewards.new
    # respond_with(@sponsorship)
  end

  def edit
    @sponsorship = Sponsorship.find(params[:id])
  end

  def create
    @sponsorship = current_user.sponsorships.build(sponsorship_params)
    @sponsorship.user_id = current_user.id
    if @sponsorship.save
      respond_with(@sponsorship)
    else
      render :new
    end
    # @sponsorship = Sponsorship.new(sponsorship_params)
    # if @sponsorship.save
    #   respond_with(@sponsorship)
    # else
    #   render :new
    # end
  end

  def update
    @sponsorship = Sponsorship.find(params[:id])
    if @sponsorship.update_attributes(sponsorship_params)
      respond_with(@sponsorship)
    else
      render 'edit'
    end
  end

  def destroy
    @sponsorship.destroy
    respond_with(@sponsorship)
  end

  private

  # def get_sponsorship
  #   @sponsorship = Sponsorship.find(params[:sponsorship_id])
  # end
  # Use callbacks to share common setup or constraints between actions.

    def set_sponsorship
      @sponsorship = Sponsorship.find(params[:id])
    end

    def sponsorship_params
      params.require(:sponsorship).permit(:sport, :level, :description, :user_id, rewards_attributes: [:id, :good, :number_of_goods, :_destroy])
    end
end
