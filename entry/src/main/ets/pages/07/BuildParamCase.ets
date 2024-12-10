@Entry
@Component
struct BuildParamCase {
  @Builder getCardItem1(){
    Image($r("app.media.pic19")).borderRadius("50%").height(80).width(80)
  }
  @Builder getCardItem2(){
   Button("卡片2的内容").width(200)
  }
  build() {
    Column({ space: 20 }) {
      BuildItem({
        buildItemContent:()=>{
          this.getCardItem1()
        }
      })
      BuildItem({
        buildItemContent:()=>{
          this.getCardItem2()
        }
      })
      BuildItem()
    }.width("100%").backgroundColor("#ccc").height("100%").justifyContent(FlexAlign.Center)
  }
}

@Component
struct BuildItem {
  @Builder
  getBuildItem() {
    Text("默认内容").textAlign(TextAlign.Center).height("100%").width("100%")
  }

  @BuilderParam
  buildItemContent: () => void = this.getBuildItem

  build() {
    Row() {
      this.buildItemContent()
    }.borderRadius(6).width("90%").backgroundColor("#fff").height(100).justifyContent(FlexAlign.Center)
  }
}