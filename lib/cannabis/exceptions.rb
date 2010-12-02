module Cannabis
  module Exceptions
    # Exception that gets raised when permissions are broken for whatever reason.
    class Transgression < StandardError; end

    # Exception that gets raised when wrong action given.
    class InvalidAction < StandardError; end
  end
end
