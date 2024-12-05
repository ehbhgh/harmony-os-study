
import {WsNavBar,WsCommentItem,WsBarTitle} from "../04/components"

@Entry
@Component
struct ZhiHu {
  build() {
    Column() {
      WsNavBar({ title: "评论回复" })
      WsCommentItem()
      Divider().strokeWidth(2)
      WsBarTitle()
    }
  }
}