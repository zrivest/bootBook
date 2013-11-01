class StatusController < ApplicationController
  def create
    render params.inspect
  end

  def destroy

  end
end
