@Component
struct WsPanel {
  @BuilderParam
  body: () => void

  build() {
    Column() {
      if (this.body) {
        this.body()
      }
    }.margin(20)
  }
}

export {
  WsPanel
}