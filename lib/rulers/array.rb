class Array
  def deeply_empty?
    empty? || all?(&:empty?)
  end

  def all_to(string)
    map { string }
  end

  def is_great?
    select { |item| item == 'great' }
  end
end
