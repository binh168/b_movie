require "rails_helper"

RSpec.describe FilmProfile, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:film) }
  end
end
