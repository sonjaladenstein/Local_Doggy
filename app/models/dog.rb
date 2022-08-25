class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end



  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


end
