class ChecksController < ApplicationController

  def index
    @filterrific = initialize_filterrific(
      Check,
      params[:filterrific]
    ) or return

    @checks = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @check = Check.find(params[:id])
  end

  def import
    Check.import(params[:file])
    redirect_to root_url, notice: "Checks imported."
  end

end
