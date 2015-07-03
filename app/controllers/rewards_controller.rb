class RewardsController < ApplicationController
  before_filter :load_sponsorship

  def create
    @reward = @sponsorship.rewards.build(reward_params)
  end

  def destroy
    @reward.destroy
    respond_with(@reward)
  end

  private

    def reward_params
      params.require(:reward).permit(:number_of_goods, :good, :sponsorship_id)
    end

    def load_sponsorship
      @sponsorship = Sponsorship.find(params[:sponsorship_id])
    end
end
