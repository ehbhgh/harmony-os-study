@Entry
@Component
struct RelativeContainerCase {

  build() {
    Column() {
      RelativeContainer() {
        Text("card1")
          .fontSize(25)
          .width(160)
          .height(150)
          .textAlign(TextAlign.End)
          .backgroundColor(Color.Green)

        Text("card2")
          .fontSize(25)
          .width(90)
          .height(130)
          .backgroundColor(Color.Yellow)
        Text("card3")
          .fontSize(25)
          .backgroundColor(Color.Red)

      } .width("100%")
      .height(190)
      .backgroundColor(Color.Blue)

    } .size({width: "100%", height: "100%"})
    .backgroundColor(Color.Orange)
    .padding(10)
  }
}