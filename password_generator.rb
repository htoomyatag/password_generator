require 'json'

class PasswordGenerator
  CHARACTER_SETS = {
    small_letters: ('a'..'z').to_a,
    capital_letters: ('A'..'Z').to_a,
    numbers: ('0'..'9').to_a,
    symbols: ['!', '#', '$', '%', '&', '(', ')', '*', '+', '@', '^']
  }

  def initialize(config)
    @config = config
  end

  # Generate a secure password based on the configuration
  def generate_secure_password
    selected_sets = CHARACTER_SETS.select { |key, set| @config["use_#{key}"] }
    required_chars = selected_sets.values.map(&:sample)

    min_length = [@config['min_length'], required_chars.length].max
    remaining_length = min_length - required_chars.length
    additional_chars = selected_sets.values.flatten.sample(remaining_length)
    
    (required_chars + additional_chars).shuffle.join
  end

end

# Read configuration from JSON file
def load_config(file_path)
  config_file = File.read(file_path)
  JSON.parse(config_file)
end

# Usage example:
config = load_config('password_config.json')
password_generator = PasswordGenerator.new(config)
password = password_generator.generate_secure_password
puts password
