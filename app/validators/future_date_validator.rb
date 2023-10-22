# frozen_string_literal: true

class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present? && value <= Date.current

    message = options[:message] || :future_date
    record.errors.add(attribute, message)
  end
end
