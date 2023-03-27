class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :link_params, only: [:update]
  before_action :set_link, only: %i[update destroy]

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
    @link.update(link_params)
  end

  def destroy
    respond_to do |format|
      if @link.destroy
        format.html { redirect_to dashboard_path, notice: "Link was removed!" }
      else
        format.html { redirect_to dashboard_path, notice: "There was error removing link!" }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
