
import { TabBarInterface, TabBarInterfaceModel } from "./model"


@Entry
@Component
struct BuildTabCase {
  @State tabList: Array<TabBarInterface> = [
    {
      icon: $r("app.media.old_chat"),
      selectIcon: $r("app.media.selected_chat"),
      cnTitle: "微信",
      enTitle: "weChat"
    }, {
    icon: $r("app.media.old_contact"),
    selectIcon: $r("app.media.selected_contact"),
    cnTitle: "联系人",
    enTitle: "contact"
  }, {
    icon: $r("app.media.old_found"),
    selectIcon: $r("app.media.selected_found"),
    cnTitle: "发现",
    enTitle: "found"
  }, {
    icon: $r("app.media.old_my"),
    selectIcon: $r("app.media.selected_my"),
    cnTitle: "我的",
    enTitle: "itSMine"
  }]
  @State currentIndex: number = 0

  @Builder
  getTabBarBuilder(item: TabBarInterfaceModel, index: number) {
    Column({ space: 8 }) {
      Image(this.currentIndex === index ? item.selectIcon : item.icon).width(20).height(20)
      Text(item.cnTitle).fontSize(12).fontColor(this.currentIndex === index ? "#20862D" : "#000")
    }.width("100%")
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: TabBarInterface, index: number) => {
        TabContent() {
          Text(`${item.cnTitle}---${item.enTitle}--${this.currentIndex}`)
        }.tabBar(this.getTabBarBuilder(new TabBarInterfaceModel(item),index))
      })
    }.barPosition(BarPosition.End)
  }
}

