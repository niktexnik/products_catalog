module Sessions
  class SessionSerializer < BaseSerializer
    attributes :id, :name, :email, :auth_token
  end
end
