@Entry
@Component
struct ProvideCase {
  @Provide("life")
  money: number = 10000

  build() {
    Row() {
      Column() {
        Text(`爷爷的退休工资${this.money}`)
        Text("爷爷组件").fontSize(30)
        Button("发退休金").onClick(() => {
          this.money += 10000
        })
        Parent()
      }.width("100%")
    }.height("100%")
  }
}

@Component
struct Parent {
  @Consume("life")
  abc: number

  build() {
    Column() {
      Text("父亲组件").fontSize(26)
      Button("还房贷").onClick(() => {
        this.abc -= 4500
      })
      Child()
    }
  }
}

@Component
struct Child {
  @Consume("life")
  money: number

  build() {
    Column() {
      Text("子组件").fontSize(22)
      Button("买玩具").onClick(() => {
        this.money -= 5000
      })
    }
  }
}