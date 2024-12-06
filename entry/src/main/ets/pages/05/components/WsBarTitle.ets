@Preview
@Component
struct WsBarTitle {
  @Prop
  commentNum: number = 0

  build() {
    Row() {
      Text("评论数").margin({
        right: 3
      })
      Text(this.commentNum + "")
    }.width("100%").height(40).padding({
      left: 10,
      top: 20,
    })
  }
}

export {
  WsBarTitle
}