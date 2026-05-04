class Attempts::CreateService
  def self.call(user:, problem:, answer:)
    result = Trainer::AnswerChecker.new(
      task: problem,
      submitted_answer: answer
    ).call

    last_attempt_number = Attempt
      .where(user: user, problem: problem)
      .maximum(:attempt_number)
      .to_i

    attempt = Attempt.create!(
      user: user,
      problem: problem,
      user_answer: answer,
      is_correct: result[:correct],
      attempt_number: last_attempt_number + 1,
      solved_at: result[:correct] ? Time.current : nil
    )

    { attempt: attempt, correct: result[:correct] }
  end
end
