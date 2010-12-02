module Cannabis
  module Cans
    def can?(can, resource)
      return false if resource.nil?
      able = Cannabis.actions[can]
      raise Exceptions::InvalidAction if able.nil?
      resource.send("#{able}_by?", self)
    end
  end
end
