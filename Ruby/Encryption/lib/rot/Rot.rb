module Encryption
  class Encryption::Rot

    attr_accessor :rotation, :case_insensitive, :upper

    def initialize(rotation = 0, case_insensitive = false, upper = false)
      @rotation, @case_insensitive, @upper = rotation, case_insensitive, upper
    end

    def encrypt_c(c)
      nc = check_case(c)
      ord = nc.ord
      rord = transpose_by_case(ord)
      rord.chr
    end

    def encrypt_s(s)
      s.chars.inject('') { |r, c| r + encrypt_c(c) }
    end

    def decrypt_s(s)
      ds = ''
      flip_rotation do
        ds = encrypt_s(s)
      end
      ds
    end

    def decrypt_c(c)
      dc = ''
      flip_rotation do
        dc = encrypt_c(c)
      end
      dc
    end

    def flip_rotation(&blk)
      old_rotation = @rotation
      @rotation = @rotation - (2 * @rotation)
      yield
      @rotation = old_rotation
    end

    protected

    def check_case(c)
      @case_insensitive ?
        (upper ? c.upcase : c.downcase) :
        c
    end

    def transpose_by_case(ord)
      rord = ord

      if Encryption.is_char_lowercase(ord)
        lower_shift = Encryption::LOWERCASE_MIN_ORD - @rotation
        srord = rord - lower_shift
        rord = (srord % 26) + Encryption::LOWERCASE_MIN_ORD
      elsif Encryption.is_char_uppercase(ord)
        upper_shift = Encryption::UPPERCASE_MIN_ORD - @rotation
        srord = rord - upper_shift
        rord = (srord % 26) + Encryption::UPPERCASE_MIN_ORD
      end

      rord
    end

  end
end