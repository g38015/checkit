class Api::V1::ChecksController < ApplicationController
  
  def index
    @checks = Check.all 
  end

end
