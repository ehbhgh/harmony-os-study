@Entry
@Component
struct ScrollCase {
  @State message: string = 'Hello World';
 scroller: Scroller = new Scroller();
  build() {
    Column() {
      TopCard()
      MainCard()
      BottomCard()
    }.height("100%")
  }
}



@Component
struct TopCard {
  build() {
    Column() {
      Text('顶部').fontColor('#ffffff').textAlign(TextAlign.Center).height("100%")
    }.width("100%").height(60).backgroundColor(Color.Blue).onClick(()=>{

    })
  }
}

@Component
struct BottomCard {
  build() {
    Column() {
      Text('底部').fontColor('#ffffff').textAlign(TextAlign.Center).height("100%")
    }.width("100%").height(60).backgroundColor(Color.Green)
  }
}

@Component
struct MainCard {
  build() {
    Column() {
      Scroll() {
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap
        }) {
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
          MainCardItem()
        }

      }
    }.width("100%").backgroundColor(Color.Red).layoutWeight(1)
  }
}

@Component
struct MainCardItem {
  build() {
    Row() {
      Text('内容') {
      }.fontColor("#ffffff").height("100%").textAlign(TextAlign.Center).width('100%')
    }
    .width(100)
    .height(200)
    .borderRadius(6)
    .backgroundColor(Color.Orange)
    .margin(10)
  }
}