class DessertsController < ApplicationController
  def index
    #Create some exemples desserts
    @dessert = Dessert.new("Ice Cream", 200)
    @healthy_dessert = Dessert.new("Fruit", 100)
    @jelly_bean = JellyBean.new("Jelly Bean", 100, "Cherry")
    @black_licorice = JellyBean.new("Black Licorice", 200, "Black Licorice")
  end

  def check
    name = params[:name]
    calories = params[:calories].to_i
    flavor = params[:flavor]

    if flavor.present?
      @dessert = JellyBean.new(name, calories, flavor)
    else
      @dessert = Dessert.new(name, calories)
    end

    render :result

  end

end
