class Event < ApplicationRecord
  before_save :check_time
  validates :name, presence: true
  has_many :notes, dependent: :destroy
  has_many :payments, dependent: :destroy

  def check_time
    if self.start_time > self.end_time
      throw :abort
    end
  end
end
