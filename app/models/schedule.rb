class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :starting_time, :finish_time, presence: true

  after_create do
    schedule = Schedule.find(id)
    schedule.url = "/schedules/#{schedule.id}/edit"
    schedule.save
  end
end
