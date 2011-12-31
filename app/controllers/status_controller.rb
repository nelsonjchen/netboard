class StatusController < ApplicationController
  def show
    @title = "Bandwidth Usage"
    @address = request.remote_ip
    @query = false

    if params[:address]
      @address = params[:address]
      @query = true
    end

    @host = Host.find_by_address(@address)

    respond_to do |format|
      format.html do
        if @host
          render
        else
          if @query
            render "unknown"
          else
            render "outside"
          end
        end
      end
      format.json {render :json => @host}
    end

  end

  def redirect
    redirect_to address_pretty_path(params[:address])
  end

end
