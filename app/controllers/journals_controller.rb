class JournalsController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :create, :update_page, :update]
  def index
    p @user_id
    @journals = Journal.where('user_id = ?', current_user.id)
    @journal = Journal.new
    render 'journals/index'
  end

  def graph_all
    sum = 0
    liabilities_result = []
    assets_result = []
    Journal.where('user_id = ?', current_user.id).each do |j|
      sum += j.amount
      if j.kind == 'assets' then
        assets_result.push [{value: sum}]
      else
        liabilities_result.push [{value: sum}]
      end
    end
    render json: {assets: assets_result.flatten,
                  liabilities: liabilities_result.flatten}
  end

  def create
    Journal.create(amount: params['journal']['amount'],
                   kind: params['kind']['name'],
                   user_id: params['journal']['user_id'],
                   usefulness: params['journal']['usefulness'])
    redirect_to '/'
  end
  def update_page
    @journal = Journal.where('id = ?', params[:id]).all.first
    render 'journals/update_page'
  end
  def update
    Journal.find(params['journal']['id'])
      .update(amount: params['journal']['amount'],
              kind: params['kind']['name'],
              usefulness: params['journal']['usefulness'])
    redirect_to '/'
  end
  def delete
    Journal.find(params['journal']['id']).delete
    redirect_to '/'
  end
end
