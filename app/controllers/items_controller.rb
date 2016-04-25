class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Large' , 
                                  :country => 'jp',
                                  :item_page => 2
                                  )
      @amazon_items = response.items
      
      #binding.pry
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
