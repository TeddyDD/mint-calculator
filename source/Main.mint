component Main {
  style base {
    font-family: sans;

    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    height: 95vh;
    width: 95vw;
  }

  fun render : Html {
    <div::base>
      <h1>
        <{ "Mint Calculator" }>
      </h1>

      <Calculator/>

      <DownloadButton href="https://github.com/TeddyDD/mint-calculator">
        <{ "Get source code" }>
      </DownloadButton>
    </div>
  }
}
