#Placeholder for a model

class Recipe < ActiveRecord::Base
 
    attr_accessor :name, :ingredients, :cook_time

    def initialize(name, ingredients, cook_time)
        @name = name
        @cook_time = cook_time
        @ingredients = ingredients
    end 
end 