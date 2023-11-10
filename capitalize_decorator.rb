require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    capitalized_name = original_name.capitalize
  end
end
