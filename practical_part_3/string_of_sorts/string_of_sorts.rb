module StringOfSorts
  def StringOfSorts.sort_string(str, template)
    result = template.chars.uniq.inject('') do |result, char|
      result + char * str.count(char)
    end

    str.chars.inject(result) do |result, char|
      template.include?(char) ? result : result + char
    end
  end
end
