@Component
struct WsList {
  @State list: object[] = []
  @BuilderParam
  getContent: (item: object) => void

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