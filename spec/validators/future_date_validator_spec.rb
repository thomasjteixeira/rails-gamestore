# frozen_string_literal: true

require 'rails_helper'

class Validator
  include ActiveModel::Validations
  attr_accessor :date

  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validator.new }

  context 'when date  is before current date' do
    before { subject.date = 1.day.ago }

    it 'should be invalid' do
      expect(subject.valid?).to be_falsey
    end

    it 'add an erro on model' do
      subject.valid?
      expect(subject.errors.attribute_names).to include(:date)
    end
  end

  context 'when date is equal current date' do
    before { subject.date = Date.current }

    it 'should be invalid' do
      expect(subject.valid?).to be_falsey
    end

    it 'add an erro on model' do
      subject.valid?
      expect(subject.errors.attribute_names).to include(:date)
    end
  end

  context 'when date is greater then current date' do
    before { subject.date = Time.zone.now + 1.day }

    it 'should be valid' do
      expect(subject.valid?).to be_truthy
    end
  end
end
