import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct WatchCase {
  @State
  @Watch("watchMsg")
  message: string = 'Hello World';

  //有一个参数，就是改的那个变量名，基本没什么拥
  watchMsg(msg: string) {
    //通过this.message拿到最新的值
    console.log(this.message)

  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
        Button("修改变量").onClick(() => {
          this.message = "parentChange"
        })
        Divider().strokeWidth(2).color("#ccc")

        WatchChild({
          message: this.message
        })
      }.width("100%")
    }.height("100%")
  }
}


@Component
struct WatchChild {
  @Prop
  @Watch("updateMessage")
  message: string = ""

  updateMessage() {
    promptAction.showToast({ message: "父组件变化了" })
  }

  build() {
    Column() {
      Text("子组件变化")
      Text(this.message)
    }
  }
}