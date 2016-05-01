class RankingController < ApplicationController
  def have
    item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    #binding.pry
    
    @items = Item.find(item_ids.keys).sort_by{|o| item_ids.keys.index(o.id)}
    #@items = Item.find(item_ids).sort_by{|k,v| v}
    #@items = Item.all.order("updated_at DESC").limit(30)
  end
  
  def want
    item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    @items = Item.find(item_ids.keys).sort_by{|o| item_ids.keys.index(o.id)}
  end
end