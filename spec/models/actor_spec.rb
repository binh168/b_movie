require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:actor_films) }
  end
end
