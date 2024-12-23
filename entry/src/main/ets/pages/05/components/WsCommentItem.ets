import { ReplyItem, ReplyItemModel } from "../models"
import { promptAction } from '@kit.ArkUI'

@Component
struct WsCommentItem {
  @ObjectLink
  item: ReplyItemModel

  changeThumbsUp() {
    this.item.likeFlag = !this.item.likeFlag
    this.item.likeFlag ? this.item.likeNum-- : this.item.likeNum++

  }

  build() {
    Row() {
      Image(this.item.avatar).width(36).height(36).borderRadius(18).margin({
        right: 20
      })
      Column({ space: 5 }) {
        Text(this.item.author).fontColor("#000").fontSize(18).fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .lineHeight(24)
          .fontColor('#565656')
        Row() {
          Text(`${this.item.time} IP属地${this.item.area}`).fontColor("#c3c4c5").fontSize(16)
          Row() {
            Image($r("app.media.heart")).fillColor(this.item.likeFlag ? "#D72626" : "#c3c4c5").margin({
              right: 5
            }).width(12).aspectRatio(1)
            Text(this.item.likeNum + "").fontSize(16).fontColor(this.item.likeFlag ? "#D72626" : "#c3c4c5")
          }.onClick(() => {
            this.changeThumbsUp()
          })
        }.justifyContent(FlexAlign.SpaceBetween).width('100%')
      }.layoutWeight(1).alignItems(HorizontalAlign.Start).width('100%')
    }.padding({
      left: 15,
      right: 10
    }).width('100%').alignItems(VerticalAlign.Top).margin({
      top: 10,
      bottom: 10
    })

  }
}

export { WsCommentItem }