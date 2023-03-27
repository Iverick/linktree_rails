class LinksController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]
  before_action :link_params, only: [:update]

  def create
    @link = Link.new(user: current_user, title: '', url: '')

    respond_to do |format|
      if @link.save
        format.html { redirect_to dashboard_path, notice: "Link was added!" }
      else
        format.html { redirect_to dashboard_path, notice: "There was error while adding link!" }
      end
    end
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
