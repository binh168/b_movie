require "rails_helper"

RSpec.describe ActorFilm, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:actor) }
    it { is_expected.to belong_to(:film) }
  end
end
