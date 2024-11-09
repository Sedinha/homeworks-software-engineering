class JellyBean < Dessert
  
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    @flavor.downcase != "black licorice"
  end
end