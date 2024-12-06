@Component
export struct WsInput {
  @State
  content:string=""
  build() {
    Row() {
      TextInput({ placeholder: "请留下您的评论",text:$$this.content}).width(250).height(40).borderRadius(0)
      Button("发布").layoutWeight(1).type(ButtonType.Normal).height(40)
    }.height(60).width("100%")

  }
}