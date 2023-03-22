class ApplicationController < ActionController::Base
  before_action :render_navbar

  def render_navbar
    @render_navbar = false
  end
end
