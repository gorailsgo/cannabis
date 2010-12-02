module Cannabis
  module Enforcers
    def self.included(controller)
      controller.helper_method :can? if controller.respond_to?(:helper_method)
      controller.hide_action :can? if controller.respond_to?(:hide_action)
    end

    # delegates the call to current_user
    def can?(can, resource)
      current_user.can?(can, resource)
    end

    private

    def authorize!(can, resource)
      raise Exceptions::Transgression unless can?(can, resource)
    end
  end
end
