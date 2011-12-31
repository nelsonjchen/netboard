class StatusController < ApplicationController
  def show
    @title = "Bandwidth Usage"
    @address = params[:address] || request.remote_ip
    @host = Host.find_by_address(@address)

    respond_to do |format|
      format.html {render }
      format.json {render :json => @host}
    end

  end

end
