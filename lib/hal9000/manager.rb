# coding: utf-8

module HAL9000
  class Manager

    HAL_FILE = "#{ENV['HOME']}/.hal"

    attr_accessor :actionstore

    def initialize
      @actionstore = ActionStore.new
      populate
    end

    def list_actions
      actionstore.list
    end

    def create_action(thought, action)
      action = Action.new(thought, action)
      return unless actionstore.add_action(action)
      persist
    end

    def delete_action(thought)
      return unless actionstore.delete_action(thought)
      persist
    end

    def find_action(thought)
      actionstore.find_action(thought)
    end

    # Persistence ==============================================================

    def hal_file
      ENV['HAL_FILE'] || HAL_FILE
    end

    def populate
      unless !File.exist?(hal_file)
        storage = Oj.load(IO.read(hal_file), { :mode => :compat, :indent => 2 })
        storage['actions'].each do |action|
          actionstore.add_action(Action.new(action['thought'], action['action']))
        end
      end
    end

    def persist
      File.open(hal_file, 'w') { |f| f.write(to_json) }
    end

    def to_json
      Oj.dump(actionstore, { :mode => :compat, :indent => 2 })
    end

  end # class Manager
end # module HAL9000