require 'flipper'
require 'flipper/adapters/active_record'

module Flipper
  module Rails
    def self.flipper
      @flipper ||= begin
                     register :admins
                     Flipper.new(Flipper::Adapters::ActiveRecord.new)
                   end
    end

    def self.register(group)
      group_sym = group.to_sym
      Flipper.register(group_sym, &:admin?) unless Flipper.group_exists? group_sym
    end
  end
end
