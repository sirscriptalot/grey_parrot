class GreyParrot
  VERSION = "0.0.0".freeze

  # Provide a base error class that our caller can rescue from to ensure they
  # catch all of our custom error, even if we add more in the future.
  class Error < StandardError; end

  # The exception that we raise when #match! fails.
  class MatchError < Error; end

  # An internal class that "matches" anything. Used as our default value to
  # allow instances of GreyParrot to alway match the first value it encounters.
  class Wildcard
    def ===(other)
      true
    end
  end

  # Cut down on object allocation by reusing the same instance of Wildcard for
  # our default value on initialization.
  DEFAULT_VALUE = Wildcard.new

  # We provide both a reader and writer to provide the most flexibility to
  # our users. It is not necessarilly dangerous to set value after
  # initialization, though it might make it more difficult to understand your
  # appllication.
  attr_accessor :value

  def initialize(value = DEFAULT_VALUE)
    @value = value
  end

  def match(other)
    if @value === other
      # We always assign other as our value if we match. This means our value
      # could become something wildly different but allows for cool things like
      # providing most restrictive initial values that our DEFAULT_VALUE.
      @value = other

      # The reason why we return true and not our value, is that our value
      # could be anything, even false which prevent this method from behaving
      # as expected when used as a predicate.
      true
    else
      false
    end
  end

  # Same as #match, but raises an exception on failure rather than returning
  # false.
  def match!(other)
    if match(other)
      true
    else
      raise MatchError.new("#{@value}")
    end
  end
end
