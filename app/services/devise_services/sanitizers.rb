module DeviseServices
  module Sanitizers
    class Organization < Devise::ParameterSanitizer
      def initialize(*)
        super
        permit(:sign_up, keys: %i[name subdomain plan payment])
        permit(:account_update, keys: %i[name subdomain plan payment])
      end
    end
  end
end
