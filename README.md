# Password Generator

## Overview

This simple Ruby script generates secure random passwords based on your configuration settings. You can use it to create strong passwords for various purposes, such as online accounts or secure access.

## Getting Started

To get started with the password generator, follow these steps:

   ```bash
   git clone https://github.com/htoomyatag/password_generator.git
   cd password_generator
  ```
## Example Usage

This command generates a random password based on the default configuration settings.
   ```bash
  $ ruby password_generator.rb
  Generated Password: g)BQ6n$7C$
  ```
Modify the `password_config.json` file to configure the password generator according to your preferences.

Here's an example configuration:
   ```bash

{
  "use_small_letters": true,
  "use_capital_letters": true,
  "use_numbers": true,
  "use_symbols": false,
  "min_length": 10
}
  ```
- use_small_letters: Include lowercase letters in the password (default: true).
- use_capital_letters: Include uppercase letters in the password (default: true).
- use_numbers: Include numbers in the password (default: true).
- use_symbols: Include symbols in the password (default: false).
- min_length: Minimum length of the generated password (default: 10).

Adjust these settings to meet your specific password requirements.


## Testing
   ```bash
$ rspec password_generator_spec.rb
```

