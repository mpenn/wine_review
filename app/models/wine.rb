class Wine < ActiveRecord::Base

  validates :name, :year, :country, :varietal, presence: true
  validates :year,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_inclusion_of :varietal, :in => ['Merlot', 'Chianti', 'Pinot Noir']
  has_many :reviews, dependent: :destroy

  def average_stars
    if reviews.loaded?
      reviews.map(&:stars).compact.average
    else
      reviews.average(:stars)
    end
  end

end
