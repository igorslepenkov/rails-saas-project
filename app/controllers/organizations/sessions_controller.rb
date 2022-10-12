class Organizations::SessionsController < Devise::SessionsController
  include DeviseTenants
end
