class StatusController < ApplicationController
  def show
    address = params[:address] || request.remote_ip
    @host = Host.find_by_address(address)
  end

end
