class Person < ApplicationRecord
validates_presence_of :name, :age, :hair_color, :eye_color, :gender
end
