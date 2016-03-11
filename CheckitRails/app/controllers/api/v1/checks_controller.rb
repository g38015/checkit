class Api::V1::ChecksController < ApplicationController

  def index
    #@checks = Check.all
    #@checks = Check.search(params)
    @filterrific = initialize_filterrific(
      Check,
      params[:filterrific]
    ) or return

    @checks = @filterrific.find.page(params[:page])

  end

end
