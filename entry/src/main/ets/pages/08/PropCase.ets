@Entry
@Component
struct PropCase {
  @State num: number = 0

  build() {
    Column({space:10}) {
      Text("父组件数据" + this.num)

      Button("+1").onClick(() => {
        this.num++
      }).type(ButtonType.Normal)
      ChildItem({
        childNum: this.num
      })
    }.width("100%")
  }
}

@Component
struct ChildItem {
  @Prop
  childNum: number = 0

  build() {

    Column() {
      Divider().width(6)
      Text("子组件数据" + this.childNum)
    }.width("100%")
  }
}