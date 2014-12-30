require 'ostruct'

#
# ostruct for ruby 1.9 doesn't implement [] operater
# This a monkey patch my copying the ruby 2.0 version
class OpenStruct
  #
  # Fetch an object by id or URL
  # @param [String] name
  # @return [Object]
  #
  # @api private
  def [](name)
    @table[name.to_sym]
  end
end
