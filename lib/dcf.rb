require "rubygems"
require "treetop"
require File.join(File.dirname(__FILE__) + "/dcf_grammar")

module Dcf
  # @param [String] input
  # @return [Array, nil] An array of { attr => val } hashes or nil if failure
  def self.parse(input)
    parse = DcfParser.new.parse(input)
    return if parse.nil?

    parse.elements.collect do |i|
      paragraph = {}
      i.paragraph.elements.each do |row|
        paragraph[row.field.attribute.text_value] = row.field.value.text_value
      end
      paragraph
    end
  end

  def self.version
    "0.2.1"
  end
end
