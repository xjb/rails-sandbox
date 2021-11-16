module RSpecHelpers
  module Decorator
    def decorate(object)
      ActiveDecorator::Decorator.instance.decorate(object)
    end
  end

  module ViewAssigns
    include Decorator
    # @see RSpec::Rails::ViewAssigns#view_assigns
    # @see ActiveDecorator::Monkey::AbstractController::Rendering#view_assigns
    include ActiveDecorator::Monkey::AbstractController::Rendering
  end
end

RSpec.configure do |config|
  # config.include RSpecHelpers::Decorator, type: :decorator
  config.include RSpecHelpers::ViewAssigns, type: :view
end
