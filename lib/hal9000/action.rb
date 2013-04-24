# coding: utf-8

module HAL9000
  class Action

    attr_accessor :thought

    attr_accessor :action

    def initialize(thought, action)
      @thought = thought
      @action = action
    end

    def <=>(other)
      @thought <=> other.thought
    end

    def to_s
      "#{thought} => #{action}"
    end

  end # class Action
end # module HAL9000