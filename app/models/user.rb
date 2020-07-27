# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users

  validates :name, presence: true

  def level_tests(level)
    tests.level_tests(level)
  end
end
