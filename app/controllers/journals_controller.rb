class JournalsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @cuser = current_user
    render 'journals/index'
  end
end
