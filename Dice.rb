String.class_eval do
  def is_number?
    true if Float(self) rescue false
  end
end

Fixnum.class_eval do
  def roll_dice(size)
    value = 0
    self.times do
      if size > 0 
        value += Random.rand(size) + 1
      end
    end
    value
  end

  def method_missing(methId)
    name = methId.to_s
    first, rest = name.to_s[0], name.to_s[1, name.to_s.length]   
    if (first =~ /[d|D]/) != nil and rest.is_number?
      self.roll_dice(rest.to_i)
    else
      super
    end
  end
end

