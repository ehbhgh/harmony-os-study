import { promptAction } from "@kit.ArkUI"

@Component
export struct WsInput {
  @State
  content: string = ""
  submitComment: (content: string) => void = () => {

  }

  publishComment() {
    if (this.content) {
      this.submitComment(this.content)
      this.content = ""
    } else {
      promptAction.showToast({ message: "发布内容不能为空" })
    }
  }

  build() {
    Row() {
      TextInput({ placeholder: "请留下您的评论", text: $$this.content })
        .width(250)
        .height(40)
        .borderRadius(0)
        .onSubmit(() => {
          this.publishComment()
        })
      Button("发布").layoutWeight(1).type(ButtonType.Normal).height(40).onClick(() => {
        this.publishComment()
      })
    }.height(60).width("100%")

  }
}