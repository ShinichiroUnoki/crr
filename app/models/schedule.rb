class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :starting_time, :finish_time, presence: true

  if Rails.env.development?
    after_create do
      schedule = Schedule.find(id)
      schedule.url = "http://localhost:3000/schedules/edit/#{schedule.id}"
      schedule.save
    end
  end
  if Rails.env.production?
    after_create do
      schedule = Schedule.find(id)
      schedule.url = "https://crr2020.herokuapp.com/schedules/edit/#{schedule.id}"
      schedule.save
    end
  end
end
