class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_csv, only: :create
  #
  # index
  #
  def index
    @campaigns = current_user.campaigns
  end

  # create
  # It save file data in db table
  def create
    if @csv.is_valid_file?
      campaign = Campaign.create!(permitted_params.merge(user_count: @csv.get_record_count))
      redirect_to campaigns_path
    else
      flash[:alert] = "File must contain firstname, lastname, phone number and  email in header"
      redirect_to new_campaign_path
    end
  end

  def new
  end

  private

  def permitted_params
    permitted = params.permit(:import_file, :name)
    permitted[:user_id] = current_user.id

    permitted
  end

  def initialize_csv
    @csv ||= ImportCampaign.new(params[:import_file])
  end

end
