class AnswersChannel < ApplicationCable::Channel
  def follow
    stream_from "question_#{ data['id'] }"
  end
end