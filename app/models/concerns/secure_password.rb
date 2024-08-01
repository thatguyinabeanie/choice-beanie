module SecurePassword
  extend ActiveSupport::Concern

  MAX_CHARACTER_LENGTH = 50
  SPECIAL_CHARACTERS = %w[! @ # $ % ^ & * ( ) - _ = + \] ? / < >].freeze

  def self.generate_secure_password(max_length: MAX_CHARACTER_LENGTH) # rubocop:disable Metrics/AbcSize
    min_length = 8
    raise ArgumentError, "max_length must be at least #{min_length}" if max_length < min_length

    loop do
      lower_case = Faker::Alphanumeric.alphanumeric(number: 1, min_alpha: 1, min_numeric: 0).downcase
      upper_case = Faker::Alphanumeric.alphanumeric(number: 1, min_alpha: 1, min_numeric: 0).upcase
      digit = Faker::Number.digit.to_s
      special_char = SPECIAL_CHARACTERS.sample

      remaining_length = rand((min_length - 4)..(max_length - 4))
      remaining_chars = Faker::Alphanumeric.alphanumeric(number: remaining_length, min_alpha: 1, min_numeric: 1)

      password = (lower_case + upper_case + digit + special_char + remaining_chars).chars.shuffle.join

      return password if complexity_check(password)
    end
  end

  def self.complexity_check(password)
    password.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/)
  end
end
