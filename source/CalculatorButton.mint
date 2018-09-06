component CalculatorButton {
  property operator : Bool = false
  property wide : Bool = false
  property children : Array(Html) = []
  property onClick : Function(Html.Event, Void) = (event : Html.Event) : Void => { void }

  get backgroundColor : String {
    if (operator) {
      "#73c44e"
    } else {
      "#eee"
    }
  }

  get color : String {
    if (operator) {
      "#eee"
    } else {
      "#111"
    }
  }

  get borderStyle : String {
    if (operator) {
      "2px solid #666"
    } else {
      "2px solid #ccc"
    }
  }

  get grid : String {
    if (wide) {
      "1/3"
    } else {
      "auto"
    }
  }

  style button {
    background-color: {backgroundColor};
    border: {borderStyle};
    grid-column: {grid};
    color: {color};
  }

  fun render : Html {
    <div::button onClick={onClick}>
      <{ children }>
    </div>
  }
}
