require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    trimmed_name = original_name[0, 10] # Keep the first 10 characters
    return trimmed_name
  end
end
