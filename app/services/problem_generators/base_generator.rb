module ProblemGenerators
  class BaseGenerator
    def initialize(problem)
      @problem = problem
    end

    def call
      raise NotImplementedError, "Нужно реализовать call в генераторе"
    end

    private

    attr_reader :problem
  end
end
