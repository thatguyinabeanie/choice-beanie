module SecurePassword
  extend ActiveSupport::Concern

  MIN_CHARACTER_LENGTH = 8
  MAX_CHARACTER_LENGTH = 50
  LENGTH_REGEX = /.{#{MIN_CHARACTER_LENGTH},#{MAX_CHARACTER_LENGTH}}/

  LOWERCASE_REGEX = /[a-z]/
  UPPERCASE_REGEX = /[A-Z]/
  DIGIT_REGEX = /\d/

  SPECIAL_CHARACTERS = %w[@ $ ! % * ? & - , . < > # ^ ( ) _ + = { } | : ; ' " \\ / ~].freeze
  SPECIAL_CHAR_REGEX = /[#{Regexp.escape(SPECIAL_CHARACTERS.join)}]/

  def self.generate_secure_password(max_length: MAX_CHARACTER_LENGTH)
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
    password.present? &&
      lowercase?(password) &&
      uppercase?(password) &&
      digit?(password) &&
      special_char?(password) &&
      required_length?(password)
  end

  def self.lowercase?(password)
    password.match?(LOWERCASE_REGEX)
  end

  def self.uppercase?(password)
    password.match?(UPPERCASE_REGEX)
  end

  def self.digit?(password)
    password.match?(DIGIT_REGEX)
  end

  def self.special_char?(password)
    password.match?(SPECIAL_CHAR_REGEX)
  end

  def self.required_length?(password)
    password.match?(LENGTH_REGEX)
  end
end
