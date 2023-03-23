class DashboardController < ApplicationController
  before_action :authenticate_user!, expect: [:show]
  before_action :set_user, only: [:show]
  before_action :render_navbar

  def index
  end

  def appearance
  end

  def show
    redirect_to dashboard_path if @user.nil?
  end

  private
    def render_navbar
      @render_navbar = true
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
