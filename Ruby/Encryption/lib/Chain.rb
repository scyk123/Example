module Encryption
  class Encryption::Chain

    attr_accessor :ciphers

    def initialize(*ciphers)
      @ciphers = ciphers
    end

    def encrypt(input)
      @ciphers.inject(input) { |r, cipher|
        cipher.is_a?(Array) ? encrypt_single(r, *cipher) : encrypt_single(r, cipher)
      }
    end

    def encrypt_single(input, cipher, case_insensitive = false, upper = false)
      ret = input
      case true
      when cipher.is_a?(Integer)
        ret = Encryption::Rot.new(cipher, case_insensitive, upper).encrypt_s(input)
      when cipher.is_a?(String)
        ret = Encryption::Vigenere.new(cipher, case_insensitive, upper).encrypt_s(input)
      end
      ret
    end

    def decrypt(input)
      @ciphers.inject(input) { |r, cipher|
        cipher.is_a?(Array) ? encrypt_single(r, *cipher) : encrypt_single(r, cipher)
      }
    end

    def decrypt_single(input, cipher, case_insensitive = false, upper = false)
      ret = input
      case true
      when cipher.is_a?(Integer)
        ret = Encryption::Rot.new(cipher, case_insensitive, upper).decrypt_s(input)
      when cipher.is_a?(String)
        ret = Encryption::Vigenere.new(cipher, case_insensitive, upper).decrypt_s(input)
      end
      ret
    end

  end
end