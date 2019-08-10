# Extensions provide a auxiliary method to make operations
module Extensions
  String.class_eval do
    def is_numeric?
      true if Float(self) rescue false
    end
  end
end