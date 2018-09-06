record CalcData {
  acc : Number,
  current : Number,
  operator : String,
  equals : Bool
}

store Calculator.Store {
  state data : CalcData = {
    acc = 0,
    current = 0,
    operator = "",
    equals = false
  }

  fun clear : Void {
    next
      {
        data =
          {
            acc = 0,
            current = 0,
            operator = "",
            equals = false
          }
      }
  }

  /* Negation operator +/- */
  fun negate : Void {
    next { data = { data | current = Math.negate(data.current) } }
  }

  /* Called when any numeric button is pressed */
  fun setNumber (btn : String) : Void {
    next { data = { data | current = result }
  } where {
    result = data.current * 10 + Maybe.withDefault(0, Number.fromString(btn))
  }

  /* Called when operator button is pressed */
  fun setOperator (op : String) : Void {
    next
      {
        data =
          {
            operator = op,
            acc = data.current,
            current = 0,
            equals = false
          }
      }
  }

  /* Return result of basic operaions like addition or subtraction */
  fun doOp (acc : Number, operator : String, current : Number) : Number {
    case (operator) {
      "+" => acc + current
      "-" => acc - current
      "*" => acc * current
      "/" => acc / current
    }
  }

  fun percent : Void {
    next
      {
        data =
          { data |
            current = result,
            equals = false
          }
      }
  } where {
    result =
      data.acc * data.current / 100.0
  }

  /* Called when = button is pressed */
  fun equals : Void {
    if (data.equals == true) {
      next
        {
          data =
            { data |
              current = doOp(data.acc, data.operator, data.current),
              equals = true
            }
        }
    } else {
      next
        {
          data =
            { data |
              current = doOp(data.acc, data.operator, data.current),
              acc = backup,
              equals = true
            }
        }
    }
  } where {
    backup =
      data.current
  }

  fun mapButtonToOp (btn : String) : Void {
    case (btn) {
      "C" => clear()
      "+/-" => negate()
      "+" => setOperator("+")
      "-" => setOperator("-")
      "×" => setOperator("*")
      "÷" => setOperator("/")
      "%" => percent()
      "=" => equals()
      => setNumber(btn)
    }
  }
}
