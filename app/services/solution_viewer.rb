# app/services/trainer/solution_viewer.rb
module Trainer
  class SolutionViewer
    def initialize(task:, user: nil)
      @task = task
      @user = user
    end

    def call
      {
        task_id: @task.id,
        solution_text: @task.solution_text
      }
    end
  end
end
