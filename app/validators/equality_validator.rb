# app/validators/equality_validator.rb
class EqualityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    expected_value = options[:value]
    return if value == expected_value

    record.errors.add(attribute, "must be equal to #{expected_value}")
  end
end
