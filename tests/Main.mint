suite "Main" {
  test "Greets Mint" {
    with Test.Html {
      <Main/>
      |> start()
      |> assertTextOf("h1", "Mint Calculator")
    }
  }
}
