require "rails_helper"

RSpec.describe User, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
  end
end
