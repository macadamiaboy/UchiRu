class ApiKey < ApplicationRecord
  HMAC_SECRET_KEY = Rails.application.credentials.api_key_hmac_secret_key
  TOKEN_NAMESPACE = "tkn"

  #encrypts :random_token_prefix, deterministic: true

  belongs_to :bearer, polymorphic: true
  
  before_validation :set_common_token_prefix, on: :create
  before_validation :generate_random_token_prefix, on: :create
  before_validation :generate_raw_token, on: :create
  before_validation :generate_token_digest, on: :create

  validates_uniqueness_of :random_token_prefix, scope: [:bearer_id, :bearer_type]

  attr_accessor :raw_token

  def self.find_by_token!(token)
    find_by!(token_digest: generate_digest(token))
  end

  def self.find_by_token(token)
    find_by(token_digest: generate_digest(token))
  end

  def self.generate_digest(token)
    OpenSSL::HMAC.hexdigest("SHA256", HMAC_SECRET_KEY, token)
  end

  def token_prefix
    "#{common_token_prefix}#{random_token_prefix}"
  end

  private
  def common_token_subprefix
    if bearer_type == "User"
      "usr"
    elsif bearer_type == "Organization"
      "org"
    end
  end

  def set_common_token_prefix
    self.common_token_prefix = "#{TOKEN_NAMESPACE}_#{common_token_subprefix}_"
  end

  def generate_random_token_prefix
    self.random_token_prefix = SecureRandom.base58(6)
  end

  def generate_raw_token
    self.raw_token = [common_token_prefix, random_token_prefix, SecureRandom.base58(24)].join("")
  end

  def generate_token_digest
    self.token_digest = self.class.generate_digest(raw_token)
  end

end
