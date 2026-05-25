module Trainer
  class TaskSelector
    def initialize(category:, user:)
      @category = category
      @user = user
    end

    def call
      solved_task_ids = @user.user_task_attempts
                             .where(is_correct: true)
                             .pluck(:task_id)

      @category.tasks
               .where(is_published: true)
               .where.not(id: solved_task_ids)
               .order(:position)
               .first
    end
  end
end
