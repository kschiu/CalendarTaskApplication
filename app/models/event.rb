class Event < ActiveRecord::Base
    has_many :orders
end