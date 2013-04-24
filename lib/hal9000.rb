
require "oj"

require "hal9000/version"
require "hal9000/command"
require "hal9000/action"
require "hal9000/actionstore"
require "hal9000/manager"

module HAL9000
  
  def self.manager
    @manager ||= Manager.new
  end

end
