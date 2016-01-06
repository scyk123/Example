module Encryption
  class Encryption::Block

    def self.block(s, block_size=0)
      block = s.gsub(' ', '')
      return block if block_size <= 0
      block.scan(/.{1,#{block_size}}/).join(' ')
    end

  end
end