require "rubygems"
require "treetop"
require File.join(File.dirname(__FILE__), "dcf_grammar")

module Dcf
  # Returns an array of { attr => val } hashes
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
end
