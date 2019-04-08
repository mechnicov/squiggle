class CategoriesController < ApplicationController
  def index
    params[:sort] = ['name', 'name DESC'].include?(params[:sort]) ? params[:sort] : 'name'
    @categories = Category.order(params[:sort]).all
  end

  def show
    params[:sort] = ['name', 'name DESC', 'price', 'price DESC'].include?(params[:sort]) ? params[:sort] : 'name'
    @category = Category.find_by(slug: params[:id])
    @items = Item.where(category_id: @category.id).order(params[:sort])
  end

  def uncategorized
    @items = Item.where(category_id: nil)
  end
end
