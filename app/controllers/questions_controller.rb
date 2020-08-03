class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show 
    render plain: @question.body
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create(question_params)
    @question.save
    redirect_to @test
  end

  def destroy
    @question.destroy
    redirect_to @test 
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:test_id, :body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end

