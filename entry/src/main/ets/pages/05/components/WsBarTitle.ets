@Preview
@Component
struct WsBarTitle {
  build() {
    Row() {
      Text("评论数").margin({
        right: 3
      })
      Text("50")
    }.width("100%").height(40).padding({
      left: 10,
      top: 20,
    })
  }
}

export{
  WsBarTitle
}