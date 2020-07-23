# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users

  def level_tests(level)
    Test.joins('INNER JOIN test_passages ON test_passages.test_id = tests.id ').where(tests: {level: level},test_passages: {user_id: self.id} )
  end
end
