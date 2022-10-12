class Users::SessionsController < Devise::SessionsController
  include DeviseTenants
end
