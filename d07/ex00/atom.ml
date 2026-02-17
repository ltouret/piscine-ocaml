class virtual atom (name: string) (symbol: string) (atomic_number: int) =
  object (self)
    method name: string = name
    method symbol: string = symbol
    method atomic_number: int = atomic_number

    method to_string: string =
      self#name ^ ": " ^ self#symbol ^ ", Zahl: " ^ 
      string_of_int self#atomic_number
    
    method equals (other: atom): bool =
      self#atomic_number = other#atomic_number
end

class hydrogen =
  object
    inherit atom "Hydrogen" "H" 1
  end

class carbon =
  object
    inherit atom "Carbon" "C" 6
  end

class oxygen =
  object
    inherit atom "Oxygen" "O" 8
  end

class nitrogen =
  object
    inherit atom "Nitrogen" "N" 7
  end

class iron =
  object
    inherit atom "Iron" "Fe" 26
  end

class gold =
  object
    inherit atom "Gold" "Au" 79
  end