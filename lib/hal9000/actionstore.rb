# coding: utf-8

module HAL9000
  class ActionStore

    attr_accessor :actions

    def initialize
      @actions = []
    end

    def add_action(action)
      unless find_action(action.thought) 
        actions << action
      end
    end

    def find_action(thought)
      actions.find do |action|
        action.thought.casecmp(thought) == 0
      end
    end

    def delete_action(thought)
      actions.reject! { |action| action.thought == thought }
    end

    def list
      actions.sort.each do |action|
        puts action
      end
    end

  end # class ActionStore
end # module HAL9000