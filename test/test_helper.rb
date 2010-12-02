require "minitest/autorun"
require "cannabis"

class User
  include Cannabis::Cans
end

class Resource
  include Cannabis::Ables
end

class Controller
  include Cannabis::Enforcers
  attr_accessor :current_user, :article

  # Overriding example
  def can?(action, resource)
    return false if action == :update and current_user.nil?
    super
  end

  def show
    authorize!(:view, article)
  end

  def vaporize
    authorize!(:vaporize, article)
  end

  def update
    authorize!(:update, article)
  end
end
