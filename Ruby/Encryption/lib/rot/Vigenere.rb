module Encryption

  class Encryption::Vigenere

    def initialize(cipher, case_insensitive = false, upper = false)
      @cipher, @rot, @i = cipher, Encryption::Rot.new(0, case_insensitive, upper), 0
    end

    def encrypt_c(c)
      @rot.rotation = next_rotation
      @rot.encrypt_c(c)
    end

    def encrypt_s(s)
      s.chars.inject('') { |r, c|
        r + encrypt_c(c)
      }
    end

    def decrypt_c(c)
      nc = c
      @rot.rotation = next_rotation
      @rot.flip_rotation do
        nc = @rot.encrypt_c(c)
      end
      nc
    end

    def decrypt_s(s)
      s.chars.inject('') { |r, c|
        r + decrypt_c(c)
      }
    end

    def self.decrypt(s, cipher, case_insensitive = false, upper = false)
      this = Encryption::Vigenere.new(cipher, case_insensitive, upper)
      this.decrypt_s(s)
    end

    def cipher=(cipher)
      @cipher, @i = cipher, 0
    end

    private

    def advance_index
      @scrolling = true
      while @scrolling && @i < @cipher.length
        @i += 1
        @scrolling = (@cipher[@i] == '')
      end
      @i = 0 if @i >= @cipher.length
      @i
    end

    def next_key
      key = @cipher[@i]
      advance_index
      key
    end

    def next_ord
      next_key.ord
    end

    def rotation_from_ord(ord)
      rot = 0

      if Encryption.is_char_lowercase(ord)
        rord = (ord - Encryption::LOWERCASE_MIN_ORD)
        rot = rord % 26 
      elsif Encryption.is_char_uppercase(ord)
        rord = (ord - Encryption::UPPERCASE_MIN_ORD)
        rot = rord % 26
      end

      rot
    end

    def next_rotation
      return 0 if @cipher.length == 0
      rotation_from_ord(next_ord)
    end

  end

end