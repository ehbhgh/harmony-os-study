@Entry
@Component
struct Page {
  @State message: string = 'Hello World';

  build() {
    Flex({
      direction: FlexDirection.Row,
      wrap:FlexWrap.Wrap
    }) {
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
      Row()
        .width(100)
        .height(50)
        .backgroundColor(Color.Red).margin({
        bottom:10,
        right:10,
        left:10
      })
    }.backgroundColor(Color.Yellow).width("100%").height('100%')
  }
}