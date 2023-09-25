require 'json'
require_relative 'password_generator'

RSpec.describe PasswordGenerator do
  let(:config) do
    JSON.parse(File.read('password_config.json'))
  end

  let(:password_generator) do
    PasswordGenerator.new(config)
  end

  it 'generates a password with a minimum length' do
    password = password_generator.generate_secure_password
    expect(password.length).to be >= config['min_length']
  end

  context 'when characters are used' do
    it 'generates a password with character according to the configuration' do
      password = password_generator.generate_secure_password

      expect(password).to match(/[!#$%&()*+@^]/) if config['use_symbols']
      expect(password).to match(/[a-z]/) if config['use_small_letters']
      expect(password).to match(/[A-Z]/) if config['use_capital_letters']
      expect(password).to match(/[0-9]/) if config['use_numbers']
    end
  end

  context 'when characters are not used' do
    it 'generates a password without character according to the configuration' do
      password = password_generator.generate_secure_password

      expect(password).not_to match(/[!#$%&()*+@^]/) unless config['use_symbols']
      expect(password).not_to match(/[a-z]/) unless config['use_small_letters']
      expect(password).not_to match(/[A-Z]/) unless config['use_capital_letters']
      expect(password).not_to match(/[0-9]/) unless config['use_numbers']
    end
  end
end
