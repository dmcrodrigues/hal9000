# coding: utf-8

module HAL9000
  class Command
    class << self

      def manager 
        HAL9000.manager
      end

      def execute(args)
        case args.first when '--help', 'help', '-h', '--usage', nil
          help
        when '--version'
          version
        when '--list'
          list
        when '--create'
          thought, action = args[1], args[2]
          return help unless thought && action
          create(thought, action)
        when '--delete'
          thought = args[1]
          return help unless thought
          delete(thought)
        else
          thought = args.join(' ')
          return help unless thought
          execute_action(thought)
        end
      end

      def list
        puts "hal - here are the thoughts that we've shared."
        puts "----------------------------------------------"
        manager.list_actions
      end

      def create(thought, action)
        if manager.create_action(thought, action)
          puts "hal - done! i will keep this in mind for you."
        else
          puts "hal - clash of thoughts! you already have this thought."
        end
      end

      def delete(thought)
        if manager.delete_action(thought)
          puts "hal - gone! keep me posted if you think on this again."
        else
          puts "hal - maybe you are confused, i don't have this thought."
        end
      end

      def execute_action(thought)
        action_item = manager.find_action(thought)
        unless action_item
          puts "you - #{thought}"
          puts "hal - i don't know what you mean. maybe this will help."
          help
        else
          begin
            puts "you - #{thought}"
            puts "hal - right way sir! running: '#{action_item.action}'"
            system(action_item.action)
          rescue Exception => e 
            puts "hal - oops! i can't perform this action. here, maybe this will help."
            puts e
          end
        end
      end

      def help
        help_text = <<-EOS
          example usage:
            hal --list                          lists all actions
            hal --create <thought> <action>     create a new action
            hal --delete <thought>              delete an action

            hal <thought>                       execute an action

            hal --version                       show hal version
            hal --help                          show this shiny help
          EOS
        puts help_text.gsub(/^ {10}/, '')
      end

      def version
        puts "hal - i'm currently running the version #{HAL9000::VERSION}"
      end

    end # class << self
  end # class Command
end # module HAL9000