# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :with_true_answer, -> { where(correct: true) }
end
