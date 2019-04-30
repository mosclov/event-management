class Prospect < ApplicationRecord
  before_save :confirmed
  validates :name, presence: true
  has_many :notes, dependent: :destroy

  def create_new_event
    event = Event.new
    event.attributes.each do |name, value|
      self.attributes.each do |attr_name, attr_value|
          event.send("#{name}=", attr_value) if name == attr_name && name != "id"
      end
    end
    event.save
  end

  def confirmed
    create_new_event if self.status_changed? && self.status == 'Confirmado'
  end

end
