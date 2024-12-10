@Component
struct WsList {
  @State list: object[] = []

  @Builder
  getDefaultVal() {
    Text("默认数据")
  }

  @BuilderParam
  getContent: (item: object) => void = this.getDefaultVal

  build() {
    List({ space: 10 }) {
      ForEach(this.list, (item: object) => {
        ListItem() {
          if (this.getContent) {
            this.getContent(item)
          }
        }
      })
    }.padding(20)
  }
}


export {
  WsList
}