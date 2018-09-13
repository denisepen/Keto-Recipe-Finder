class KetoRecipes::Recipe
  attr_accessor :url, :name, :type, :calories, :protein, :carbs, :fat

  @@recipes = []

  def self.scrape_recipes

    doc = Nokogiri::HTML(open("https://ketodash.com/recipe"))

     doc.css("div.col-sm-6").collect do |dish|
       name = dish.css("div.card-header h5 a").attribute("title").text
       url = "https://ketodash.com#{dish.css("div.card-header h5 a").attribute("href").text}"
       type = dish.css("div.card-header h5 span").text
       calories = dish.css("div.card-block ul li")[0].text
       protein = dish.css("div.card-block ul li")[1].text
       fat = dish.css("div.card-block ul li")[2].text
      carbs = dish.css("div.card-block ul li")[3].text
       recipe = self.new(name, type, calories, fat, protein, carbs, url)

      # binding.pry
        # recipe = self.new
        # recipe.name = dish.css("div.card-header h5 a").attribute("title").text
        # recipe.url = "https://ketodash.com#{dish.css("div.card-header h5 a").attribute("href").text}"
        # recipe.type = dish.css("div.card-header h5 span").text
        # recipe.calories = dish.css("div.card-block ul li")[0].text
        # recipe.protein = dish.css("div.card-block ul li")[1].text
        # recipe.fat = dish.css("div.card-block ul li")[2].text
        # recipe.carbs = dish.css("div.card-block ul li")[3].text
        # @@recipes << recipe

    end
  end

  def initialize(name, type, calories, fat, protein, carbs, url)
    @name=name
    @type=type
    @calories=calories
    @fat=fat
    @protein=protein
    @carbs=carbs
    @url=url

    @@recipes << self
  end

  def self.all
    @@recipes.each.with_index(1) do |recipe, i|
      puts " #{i}. #{recipe.name}"
    end
  end

  def self.other
    @other = []
    @@recipes.each  do |recipe|
      if recipe.type != "Meal" && recipe.type != "Snack" && recipe.type != "Treat" && recipe.type != "Drink" && !recipe.name.include?("Crockpot")
        @other << recipe
      end
    end

      @other.each.with_index(1) do |other, i|
        puts "#{i}. #{other.name}"
    end
end

  def self.meal
    @meals = []
  @@recipes.each  do |recipe|
      if recipe.type == "Meal"
        @meals << recipe
      end
    end

      @meals.each.with_index(1) do |meal, i|
        puts "#{i}. #{meal.name}"
    end
end

def self.drink
  @drinks = []
  @@recipes.each  do |recipe|
    if recipe.type == "Drink"
      @drinks << recipe
    end
  end

    @drinks.each.with_index(1) do |drink, i|
      puts "#{i}. #{drink.name}"
  end
end

def self.dessert
  @dessert = []
  @@recipes.each do |recipe|
    if recipe.type == "Treat"
      @dessert << recipe
    end
  end

  @dessert
    @dessert.each.with_index(1) do |dessert, i|
      puts "#{i}. #{dessert.name}"
  end
end


def self.snack
  @snack = []
  @@recipes.each  do |recipe|
    if recipe.type == "Snack"
      @snack << recipe
    end
  end

    @snack.each.with_index(1) do |snack, i|
      puts "#{i}. #{snack.name}"
    end
  end
end
