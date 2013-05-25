class Quizzes::AttemptsController < ApplicationController

  helper "quizzes/surveys"

  def new
    @survey =  Survey::Survey.active.first
    @attempt = @survey.attempts.new
    @attempt.answers.build
    @participant = current_user # you have to decide what to do here
  end

  def create
    @survey =  Survey::Survey.where(:id => params['survey_attempt']['survey_id']).first
    @attempt = @survey.attempts.new(params[:attempt])
    @attempt.participant = current_user
    if @attempt.valid? and @attempt.save
      # now that we saved the attempt, we need to save each answer
      params['survey_attempt']['answers_attributes'].each do |awrattr|
        awrattr.each do |qnumber|
          @answer = Survey::Answer.new
          @answer.attempt_id = @attempt.id
          @answer.question_id = qnumber['question_id']
          @answer.option_id = qnumber['option_id']
          if @answer.save
            flash[:notice] = "Survey answers saved"
          end
        end
      end
    else
      flash[:error] = "Attempt did not save"
    end
    redirect_to space_task_path(params['survey_attempt']['space_id'],params['survey_attempt']['task_id'])
end

  def show
  end

  def update
  end

  def destroy
    @attempt = Survey::Attempt.find(params[:id])
    @attempt.destroy
    Survey::Answer.where(:attempt_id => params[:id]).each do |answer|
      answer.destroy
    end
    flash[:notice] = 'You reset your answers for this quiz'
    redirect_to space_task_path(params['survey_attempt']['space_id'],params['survey_attempt']['task_id'])
  end

end