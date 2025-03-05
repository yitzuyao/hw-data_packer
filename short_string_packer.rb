# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    # start with 0 as initial value
    packed = 0
    # iterate each letter of str and accumulate the result
    str.chars.each do |char|
      # convert each letter to a number from 1-26
      char_value = char.ord - 'a'.ord + 1
      # left shift 5 digits, and use a binary operation to renew packed
      packed = (packed << 5) | char_value
    end

    # return the final packed value
    packed
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    # create list to save the letters unpack from packed
    str_list = []

    # keep unpacking until there is no more letter
    until packed.zero?
      # “masking off” number not the last 5 digits using AND
      char_value = packed & 0b11111
      # tranform binary number into letter and record in list
      str_list << (('a'.ord + char_value - 1).chr)
      # right shift 5 digits to remove the number we already processed
      packed >>= 5
    end

    # reverse the list and join the letters to a string
    str_list.reverse.join
  end
end
