module RSpecHelpers
  module Decorator
    def decorate(object)
      ActiveDecorator::Decorator.instance.decorate(object)
    end
  end

  module ViewAssigns
    include Decorator

    # @see RSpec::Rails::ViewAssigns#assign
    def assign(key, value)
      super(key, decorate(value))
    end
  end
end

RSpec.configure do |config|
  # config.include RSpecHelpers::Decorator, type: :decorator
  config.include RSpecHelpers::ViewAssigns, type: :view
end
