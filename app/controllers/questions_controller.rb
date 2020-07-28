class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show find destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show 
    render plain: @question.body
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def new
    
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
