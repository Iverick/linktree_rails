class DashboardController < ApplicationController
  before_action :authenticate_user!, only: %i[index appearance]
  before_action :set_user, only: [:show]
  before_action :render_navbar, except: [:show]

  def index
  end

  def appearance
  end

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links.where.not(url: '', title: '')
  end

  private
    def render_navbar
      @render_navbar = true
    end

    def set_user
      begin
        @user = User.friendly.find(params[:id])
      rescue StandartError
        @user = nil
      end
    end
end
