@Entry
@Component
struct BuilderCase {
  @State list: string[] = ["A", "B", "C", "D", "E", "F", "G"];
  @Builder
  getItemBuilder(name: string) {
    Row() {
      Text(`${name}.选项`).fontColor(Color.White)
    }.height(80).borderRadius(8).backgroundColor("#2BB0A5").padding({
      left: 20,
      right: 20
    }).width("100%")
  }

  build() {
    Column({ space: 10 }) {
      ForEach(this.list, (item: string) => {
        this.getItemBuilder(item)
      })
    }.padding(20)
  }
}