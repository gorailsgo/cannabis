require "cannabis/ables"
require "cannabis/cans"
require "cannabis/enforcers"
require "cannabis/exceptions"
require "cannabis/version"

module Cannabis
  # Default actions to an empty hash.
  @actions = {}

  # Returns hash of actions that have been added.
  #   {:view => :viewable, ...}
  def self.actions
    @actions
  end

  # Adds an action to actions and the correct methods to can and able modules.
  #
  #   @param [Symbol] can?(method) The name of the can?([action]) method.
  #   @param [Symbol] resource_method The name of the [resource_method]_by? method.
  def self.add(can, able)
    @actions[can] = able
    Ables.send(:define_method, "#{able}_by?") { |user| true }
  end
end

Cannabis.add(:view, :viewable)
Cannabis.add(:create, :creatable)
Cannabis.add(:update, :updatable)
Cannabis.add(:destroy, :destroyable)
