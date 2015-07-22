class RewardsController < ApplicationController
  before_filter :load_sponsorship

  def create
    # @sponsorship = Sponsorship.find(params[:sponsorship_id])
    @reward = @sponsorship.rewards.build(reward_params)
  end

  def destroy
    # @sponsorship = Sponsorship.find(params[:sponsorship_id])
    @reward = @sponsorship.rewards.find(params[:id])
    @reward.destroy
    redirect_to sponsorship_path(@sponsorship), notice: 'Review was deleted'
  end

  def update
    @reward = @sponsorship.reward(params[:id])
    if @reward.update_attributes(reward_params)
      respond_with(@sponsorshop)
    else
      render 'edit'
    end
  end

  private

    def reward_params
      params.require(:reward).permit(:number_of_goods, :good, :sponsorship_id)
    end

    def load_sponsorship
      @sponsorship = Sponsorship.find(params[:sponsorship_id])
    end
end
