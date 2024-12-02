@Entry
@Component
struct GridCase {
  @State message: string = 'Hello World';
  @State services: Array<string> = []

  build() {
    Grid() {
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
      GridCaseItem()
    }
    .width('100%')
    .height("100%")
    .columnsTemplate("1fr 1fr")
    .columnsGap(10)
    .rowsGap(10).padding(10)
  }
}

@Component
struct GridCaseItem {
  build() {
    GridItem() {
      Row() {
        Text("内容").width('100%').textAlign(TextAlign.Center)
      }.height(200).borderRadius(4).backgroundColor(Color.Pink)
    }
  }
}