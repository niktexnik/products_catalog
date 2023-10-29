module Sessions
  class Create < BaseInteraction
    integer :code
    string :email
    string :token

    validates :email, :code, :token, presence: true
    validate :validate_email

    def execute
      check_expired_code
      storage
      update_auth_token
      storage.destroy if storage.is_a?(TemporaryTokenStorage)
      user
    end

    private

    def storage
      @storage ||= TemporaryTokenStorage.find_by(email:, token:, code:) || errors.add(:base, 'Not verifyed!')
    end

    def user
      @user ||= User.find_or_create_by(email:)
    end

    def update_auth_token
      user.update(auth_token: SecureRandom.base58(24))
    end

    def check_expired_code
      errors.add(:base, 'Your code was expired, please get it again') unless REDIS_CURRENT.get(email)
    end

    def validate_email
      check_email(email)
    end
  end
end
