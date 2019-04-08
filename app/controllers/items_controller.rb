class ItemsController < ApplicationController
  def index
    params[:sort] = ['name', 'name DESC', 'price', 'price DESC'].include?(params[:sort]) ? params[:sort] : 'name'
    @items = Item.order(params[:sort]).all
  end

  def show
    @item = Item.find_by(slug: params[:id])
  end
end
