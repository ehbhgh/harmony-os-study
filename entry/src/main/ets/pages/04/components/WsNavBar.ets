@Preview
@Component
struct WsNavBar {
  build() {
    Row() {
      Row() {
        Image($r("app.media.left_arrow")).width(16).height(16)
      }
      .width(30)
      .height(30)
      .borderRadius(15)
      .backgroundColor('#f4f4f4')
      .justifyContent(FlexAlign.Center)
      .margin({
        left: 20
      })

      Text("评论回复").layoutWeight(1).textAlign(TextAlign.Center).margin({
        right: 50
      })
    }.width("100%").height(50)

  }
}