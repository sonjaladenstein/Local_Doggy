class AddReferencesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, index: true
    add_reference :bookings, :dog, index: true
  end
end
