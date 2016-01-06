module Encryption
  ROOT = File.dirname(__FILE__)
  LIBRARY_LOCATION =  ROOT + '/lib/**/*.rb'
  LOWERCASE_DICT = [*'a'..'z']  
  LOWERCASE_MIN_ORD = 'a'.ord
  LOWERCASE_MAX_ORD = 'z'.ord

  UPPERCASE_DICT = [*'A'..'Z']
  UPPERCASE_MIN_ORD = 'A'.ord
  UPPERCASE_MAX_ORD = 'Z'.ord

  def self.is_char_lowercase(ord)
    ord >= LOWERCASE_MIN_ORD && ord <= LOWERCASE_MAX_ORD
  end

  def self.is_char_uppercase(ord)
    ord >= UPPERCASE_MIN_ORD && ord <= UPPERCASE_MAX_ORD
  end

  def self.is_char_letter(ord)
    is_char_lowercase(ord) || is_char_uppercase(ord)
  end

end

Dir.glob(Encryption::LIBRARY_LOCATION) { |f| require f }