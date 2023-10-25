module Sessions
  class Login < ActiveInteraction::Base
    string :email
    validates :email, presence: true

    def execute
      create_model
      send_mail
      set_code_expired
    end

    private

    def create_model
      @create_model ||= TemporaryTokenStorage.create(email:, token: generate_token, code: rand(999_999))
    end

    def send_mail
      MailgunMailer.send_verify_code(email, create_model.code)
    end

    def set_code_expired
      REDIS_CURRENT.set(email, create_model.token, ex: 60)
    end

    def generate_token
      SecureRandom.base58(24)
    end
  end
end
