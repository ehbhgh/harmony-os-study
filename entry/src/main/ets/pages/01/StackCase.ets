import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct StackCase {
  @State content: string = '';

  searchContent() {
    promptAction.showToast({
      message: this.content
    })
  }

  enabledChange() {
    return this.content !== ""
  }

  build() {
    Column(){
      Image($r("app.media.baidu")).height(200).width("100%")
      Row() {
        Stack() {
          TextInput({ placeholder: "请输入需要搜索的内容", text: $$this.content })
            .width("100%")
            .height(40)
            .position({ x: 0, y: 0 })
            .zIndex(1)
            .borderRadius({
              topLeft: 10,
              topRight: 0,
              bottomLeft: 10,
              bottomRight: 0
            }).padding({
            right:60
          })
          Image($r("app.media.microphone")).height(20).width(20).position({ x: 200, y: 10 }).zIndex(2)
          Image($r("app.media.camera")).height(20).width(20).position({ x: 230, y: 10 }).zIndex(2)
        }.width(260).height("100%")

        Button("百度一下")
          .borderRadius({
            topLeft: 0,
            topRight: 10,
            bottomLeft: 0,
            bottomRight: 10
          })
          .layoutWeight(1)
          .height("100%").type(ButtonType.Normal)
          .onClick(() => {
            this.searchContent()
          })
          .enabled(this.enabledChange())
      }.width("100%").height(40)
    }.alignItems(HorizontalAlign.Center).width("100%").padding(10)

  }
}