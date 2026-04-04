class Attempts::CreateService
  def self.call(user:, problem:, answer:)
    result = Trainer::AnswerChecker.new(
      task: problem,
      submitted_answer: answer
    ).call

    attempt = Attempt.create!(
      user: user,
      problem: problem,
      answer: answer,
      correct: result[:correct]
    )

    { attempt: attempt, correct: result[:correct] }
  end
end
