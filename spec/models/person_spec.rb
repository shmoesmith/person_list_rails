require 'rails_helper'

RSpec.describe Person, type: :model do
it { should validate_presence_of(:name) }
it { should validate_presence_of(:age) }
it { should validate_presence_of(:hair_color) }
it { should validate_presence_of(:eye_color) }
it { should validate_presence_of(:gender) }
end

