module Sessions
  class Create < ActiveInteraction::Base
    integer :code
    string :email
    string :token

    validates :email, :code, :token, presence: true
    validate :check_expired_code

    def execute
      storage
      update_auth_token
      storage.destroy if storage.is_a?(TemporaryTokenStorage)
      user
    end

    def storage
      @storage ||= TemporaryTokenStorage.find_by(email:, token:, code:) || errors.add(:error, 'Not verifyed!')
    end

    def user
      @user ||= User.find_or_create_by(email:)
    end

    def update_auth_token
      user.update(auth_token: SecureRandom.base58(24))
    end

    def check_expired_code
      errors.add(:error, 'Your code was expired, please get it again') unless REDIS_CURRENT.get(email)
    end
  end
end
