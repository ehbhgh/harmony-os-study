import { TabBarInterface, TabBarInterfaceModel } from "../06/model"
import { UserInfoInterface, UserInfoInterfaceModel } from "./model"

@Entry
@Component
struct ProvideMainCase {
  @State tabList: Array<TabBarInterface> = [
    {
      icon: $r("app.media.old_chat"),
      selectIcon: $r("app.media.selected_chat"),
      cnTitle: "群聊",
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
  @Provide userInfo: UserInfoInterfaceModel = new UserInfoInterfaceModel({} as UserInfoInterface)

  @Builder
  getTabBarBuilder(item: TabBarInterfaceModel, index: number) {
    Column({ space: 8 }) {
      Image(this.currentIndex === index ? item.selectIcon : item.icon).width(20).height(20)
      Text(item.cnTitle).fontSize(12).fontColor(this.currentIndex === index ? "#20862D" : "#000")
    }.width("100%")
  }

  aboutToAppear(): void {
    this.getUserInfo()
  }

  async getUserInfo() {
    const res = await new Promise<UserInfoInterface>((resolve) => {
      setTimeout(() => {
        resolve(new UserInfoInterfaceModel({
          userId: 1,
          userInfo: "wangsu",
          mobile: "13129111667",
          email: "2238287781@qq.com",
          role: "admin",
          avatar: ""
        }))
      }, 1000)
    })
    this.userInfo = new UserInfoInterfaceModel(res)
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: TabBarInterface, index: number) => {
        TabContent() {
          if (item.enTitle === "weChat" && this.userInfo.userInfo!=="") {
            Wechat()
          } else if (item.enTitle === "contact") {
            Contact()
          } else if (item.enTitle === "found") {
            Found()
          } else {
            Mine()
          }
        }.tabBar(this.getTabBarBuilder(new TabBarInterfaceModel(item), index))
      })
    }.barPosition(BarPosition.End)
  }
}

@Component
struct Wechat {
  @Consume userInfo: UserInfoInterfaceModel

  build() {
    Column() {
      Text("用户名：" + this.userInfo.userInfo)
    }
  }
}

@Component
struct Contact {
  @Consume userInfo: UserInfoInterfaceModel

  build() {
    Column() {
      Text("手机号：" + this.userInfo.mobile)
    }
  }
}


@Component
struct Found {
  @Consume userInfo: UserInfoInterfaceModel

  build() {
    Column() {
      Text("邮箱：" + this.userInfo.email)
    }
  }
}

@Component
struct Mine {
  @Consume userInfo: UserInfoInterfaceModel

  build() {
    Column() {
      Text("角色：" + this.userInfo.role)
    }
  }
}