@Entry
@Component
struct LinkCase {
  @State num: number = 0;

  build() {
    Row() {
      Column() {
        Column() {
          Row({ space: 10 }) {
            Text("父组件").fontSize(40)
            Text(this.num + "").fontSize(40)
          }

          Button("父组件+1").onClick(() => {
            this.num++
          }).backgroundColor(Color.Orange)
        }.margin(20)

        Divider().strokeWidth(20).backgroundColor("#ccc").width("100%")
        Column() {
          LinkChildCase({
            num: this.num
          })
        }
      }.width("100%")
    }.height("100%")
  }
}

@Component
struct LinkChildCase {
  @Link
  num: number

  build() {
    Column() {
      Row({ space: 10 }) {
        Text("子组件").fontSize(30)
        Text(this.num + "").fontSize(30)
      }

      Button("子组件+1").onClick(() => {
        this.num++
      })
    }.margin(20)
  }
}