#Our CLI controller
 class KetoRecipes::CLI
   attr_accessor :name, :type, :instructions

def call
  puts ""
  puts "--------------- Welcome ---------------"
  menu
  goodbye
end

def list_meals
  @recipes ||= KetoRecipes::Recipe.scrape_recipes
  @recipes_meal = KetoRecipes::Recipe.meal
end

def list_desserts
  @recipes ||= KetoRecipes::Recipe.scrape_recipes
  @recipes_dessert = KetoRecipes::Recipe.dessert
end


def list_recipes
  @recipes ||= KetoRecipes::Recipe.scrape_recipes
  @recipes_all = KetoRecipes::Recipe.all
end

def list_drinks
  @recipes ||= KetoRecipes::Recipe.scrape_recipes
  @recipes_drinks = KetoRecipes::Recipe.drink
end

  def list_snacks
    @recipes ||= KetoRecipes::Recipe.scrape_recipes
    @recipes_snack = KetoRecipes::Recipe.snack
  end

  def list_other
    @recipes ||= KetoRecipes::Recipe.scrape_recipes
    @recipes_other = KetoRecipes::Recipe.other
  end

  def exit
    puts ""
    puts "Thank you for taking a look at our recipes!"
  end


def menu

  input_1 = ""
  input = ""
  puts "For a list of all Ketogenic recipes press 1"
  puts "For a list of all Ketogenic Main Course recipes press 2 "
  puts "For a list of all Ketogenic Snack recipes press 3"
  puts "For a list of all Ketogenic Dessert recipes press 4"
  puts "For a list of all Ketogenic Drink recipes press 5"
  puts "For Ketogenic Dip and Sauce recipes press 6"
  puts "Type exit to end"
  puts ""
  input_1 = gets.strip

  case  input_1
      when "1"
      puts ""
      puts "---------- Recipe List ----------"
        list_recipes
        puts ""
        puts "Please choose a dish by number for nutrition information."
           input = gets.strip
          recipe_choice(input_1, input)
          puts ""
    when "2"
      puts ""
      puts "---------- Main Course Recipe List ----------"
      list_meals
      puts ""
      puts "Please choose a dish by number for nutrition information."
           input = gets.strip
          recipe_choice(input_1, input)
          puts ""
    when "3"
      puts ""
      puts "---------- Snack List ----------"
      list_snacks
      puts ""
      puts "Please choose a dish by number for nutrition information."
           input = gets.strip
          recipe_choice(input_1, input)
    when "4"
      puts ""
      puts "---------- Dessert List ----------"
    list_desserts
    puts ""
    puts "Please choose a dish by number for nutrition information."
         input = gets.strip
        recipe_choice(input_1, input)
    when "5"
      puts ""
      puts "---------- Drink List ----------"
      list_drinks
      puts ""
      puts "Please choose a dish by number for nutrition information."
          input = gets.strip
          recipe_choice(input_1, input)
    when "6"
      puts ""
      puts "---------- Dip & Sauce Recipes ----------"
      list_other
      puts ""
      puts "Please choose a dish by number for nutrition information."
          input = gets.strip
          recipe_choice(input_1, input)
    when "exit"
        exit
    else
      puts "Please enter a valid request"
      puts ""
      menu
    end
  end

def recipe_choice(input_1, input)
    if input_1 == "1"
     @recipes_input = @recipes_all
   elsif input_1 == "2"
      @recipes_input = @recipes_meal
    elsif input_1 == "3"
      @recipes_input = @recipes_snack
    elsif input_1 == "4"
      @recipes_input = @recipes_dessert
    elsif input_1 == "5"
      @recipes_input = @recipes_drinks
    elsif input_1 == "6"
      @recipes_input = @recipes_other
    elsif input == "exit"
      exit
  else
      puts "That choice is invalid. Please choose again"
      puts ""
      menu
    end

  if input != "exit" && @recipes_input[input.to_i-1]
    puts ""
    puts @recipes_input[input.to_i-1].name
    puts "------------------------"
    puts @recipes_input[input.to_i-1].calories
    puts @recipes_input[input.to_i-1].protein
    puts @recipes_input[input.to_i-1].fat
    puts @recipes_input[input.to_i-1].carbs
    puts ""
    puts "For recipe instructions please visit: #{@recipes_input[input.to_i-1].url}"
    puts ""
    # puts "Please choose again"
     menu
  elsif input == "exit"
    exit
  else
    puts "That choice is invalid. Please choose again."
    puts ""
     menu

  end
end

  def goodbye
   puts "Goodbye"
  end
end
