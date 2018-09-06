component Calculator {
  connect Calculator.Store exposing { data, clear, mapButtonToOp }

  style grid {
    display: grid;
    font-size: 30px;
    grid-template-columns: repeat(4, 1fr);
    grid-auto-rows: minmax(50px, auto);

    & * {
      padding: 0.5em;
    }
  }

  style display {
    grid-column: 1 / 5;
    background-color: #333;
    color: #eee;
  }

  style button {
    background-color: {buttonBgColor};
    border: {buttonBorder};
  }

  style operator {
    background-color: #73c44e;
    border: 2px solid #666;
    color: white;
  }

  style zero {
    grid-column: 1/3;
    background-color: {buttonBgColor};
    border: {buttonBorder};
  }

  get buttonBgColor : String {
    "#eee"
  }

  get buttonBorder : String {
    "2px solid #ccc"
  }

  /* Display acc and current operator */
  property debug : Bool = false

  get debugString : String {
    if (debug) {
      " ACC: " + Number.toString(data.acc) + " OP: " + data.operator
    } else {
      ""
    }
  }

  /* Content of the calculator display */
  property current : String = Number.toString(data.current) + debugString

  /* Return array of calculator buttons */
  get buttons : Array(Html) {
    buttons
    |> Array.mapWithIndex(
      (elem : String, idx : Number) : Html => {
        if (modulo(idx + 1, 4) == 0 || elem == "=") {
          <div::operator onClick={getClickCallback(elem)}>
            <{ elem }>
          </div>
        } else {
          case (elem) {
            "0" =>
              <div::zero onClick={getClickCallback(elem)}>
                <{ elem }>
              </div>

            =>
              <div::button onClick={getClickCallback(elem)}>
                <{ elem }>
              </div>
          }
        }
      })
  } where {
    buttons =
      [
        "C", "+/-", "%", "÷",
        "7", "8", "9", "×",
        "4", "5", "6", "-",
        "1", "2", "3", "+",
        "0", ".", "="
      ]
  }

  /* Create Html.event callback from button text */
  fun getClickCallback (btn : String) : Function(Html.Event, Void) {
    (event : Html.Event) : Void => { mapButtonToOp(btn) }
  }

  fun modulo (a : Number, b : Number) : Number {
    `a % b`
  }

  fun render : Html {
    <div::grid>
      <div::display>
        <{ current }>
      </div>

      <{ buttons }>
    </div>
  }
}
