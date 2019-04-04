class Note < ApplicationRecord
  belongs_to :prospect, optional: true
  belongs_to :event, optional: true
end
