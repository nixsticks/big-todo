class Todo < ActiveRecord::Base
  attr_accessor :todo_list, :todo_list_id
  validates :name, presence: true
  belongs_to :todo_list
end