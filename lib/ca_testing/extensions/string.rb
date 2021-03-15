# frozen_string_literal: true

class String
  # @return [String]
  #
  # Convert's a regular string name into it's pascalized format
  # This can then be used to generate a ClassName
  def pascalize
    split("_").map(&:capitalize).join
  end

  # @return [String]
  #
  # Convert's a regular string into a snake cased format
  # Will sanitize out some characters (Designed for titles)
  def snake_case
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .squeeze(" ")
      .tr("-", "_")
      .tr(" ", "_")
      .tr("'", "")
      .downcase
  end
end