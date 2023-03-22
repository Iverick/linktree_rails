class DashboardController < ApplicationController
  before_action :authenticate_user!, :render_navbar

  def index
  end

  private
    def render_navbar
      @render_navbar = true
    end
end
