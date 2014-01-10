class Todo < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :todolist
end
