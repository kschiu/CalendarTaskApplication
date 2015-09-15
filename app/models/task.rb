class Task < ActiveRecord::Base
    belongs_to :orders, dependent: :destroy
end
