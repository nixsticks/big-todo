class TodoList < ActiveRecord::Base
  validates :name, presence: true
  has_many :todos
  accepts_nested_attributes_for :todos, :reject_if => proc { |todo| todo['name'].blank? }
end