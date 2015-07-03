class SponsorshipsController < ApplicationController
  before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sponsorships = Sponsorship.all
    respond_with(@sponsorships)
  end

  def show
    @sponsorship = Sponsorship.find(params[:id])
    @application = @sponsorship.applications.build
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

    @sponsorship = Sponsorship.new(sponsorship_params)
    if @sponsorship.save
      respond_with(@sponsorship)
    else
      render :new
    end
  end

  def update
    @sponsorship.update(sponsorship_params)
    respond_with(@sponsorship)
  end

  def destroy
    @sponsorship.destroy
    respond_with(@sponsorship)
  end

  private
    def set_sponsorship
      @sponsorship = Sponsorship.find(params[:id])
    end

    def sponsorship_params
      params.require(:sponsorship).permit(:sport, :level, :description, :user_id, rewards_attributes: [:good, :number_of_goods, :_destroy])
    end
end
