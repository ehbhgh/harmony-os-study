@Component
struct WsCommentItem {
  build() {
    Row() {
      Image($r("app.media.pic18")).width(36).height(36).borderRadius(18).margin({
        right: 20
      })
      Column({ space: 5 }) {
        Text('王苏').fontColor("#000").fontSize(18).fontWeight(FontWeight.Bold)
        Text("一江秋水，依旧是澄蓝澈底。两岸的秋山，依旧在袅娜迎人。苍江几曲，就有九簇苇丛，几弯村落，在那里点缀。你坐在轮船舱里，只须抬一抬头，劈面就有江岸乌桕树的红叶和去天不远的青山向你招呼。")
          .lineHeight(24)
          .fontColor('#565656')
        Row() {
          Text('01-25 IP属地南京').fontColor("#c3c4c5").fontSize(16)
          Row() {
            Image($r("app.media.heart")).fillColor("#c3c4c5").margin({
              right: 5
            }).width(12).aspectRatio(1)
            Text("1358").fontSize(16).fontColor("#c3c4c5")
          }
        }.justifyContent(FlexAlign.SpaceBetween).width('100%')
      }.layoutWeight(1).alignItems(HorizontalAlign.Start).width('100%')
    }.padding({
      left: 15,
      right: 10
    }).width('100%').alignItems(VerticalAlign.Top).margin({
      top: 10,
      bottom:10
    })

  }
}

export {WsCommentItem}