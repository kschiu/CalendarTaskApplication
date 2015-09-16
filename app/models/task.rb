class Task < ActiveRecord::Base
    belongs_to :event, dependent: :destroy
end
