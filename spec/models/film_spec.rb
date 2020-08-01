require "rails_helper"

RSpec.describe Film, type: :model do
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:actor_films) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_one(:film_profile).dependent(:destroy) }

end
