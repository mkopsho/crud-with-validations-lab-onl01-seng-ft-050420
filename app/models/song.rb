class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] } # https://guides.rubyonrails.org/active_record_validations.html#uniqueness
  validates :released, inclusion: [true, false]
  validates :release_year, numericality: { 
    presence: true, if: :released?, # Magical boolean `?` methods from Rails!
    less_than_or_equal_to: Date.current.year
  }
  validates :artist_name, presence: true
end
