class ChecksController < ApplicationController

  def index
    @checks = Check.all
  end

  def import
    Check.import(params[:file])
    redirect_to root_url, notice: "Checks imported."
  end

end