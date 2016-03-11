class Api::V1::ChecksController < ApplicationController

  def index
    @filterrific = initialize_filterrific(Check, params[:filterrific]) or return

    @checks = @filterrific.find.page(params[:page])
  end

end
