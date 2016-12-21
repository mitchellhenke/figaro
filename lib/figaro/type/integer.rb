require "figaro/type"

module Figaro
  class Type::Integer < Figaro::Type
    def load(value)
      case value
      when nil then nil
      when /\A\-?\d+\z/ then Integer(value)
      when ::Integer then value
      else raise
      end
    end

    def dump(value)
      case value
      when nil then nil
      else value.to_s
      end
    end
  end
end

Figaro::Type.register(:integer, Figaro::Type::Integer)
