class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :questions
  has_and_belongs_to_many :users

  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id').where("categories.title = :category", category: category).order(id: :desc).pluck(:title)
  end
end
