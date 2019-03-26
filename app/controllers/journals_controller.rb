class JournalsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    p @user_id
    @journals = Journal.where('user_id = ?', current_user.id)
    @journal = Journal.new
    render 'journals/index'
  end

  def create
    Journal.create(amount: params['journal']['amount'],
                   kind: params['kind']['name'],
                   user_id: params['journal']['user_id'],
                   usefulness: params['journal']['usefulness'])
    redirect_to '/'
  end
end
