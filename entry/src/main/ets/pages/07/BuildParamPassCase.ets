import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct BuildParamPassCase {
  @State area: string = '北京市';

  @Builder
  getCardValueItem(title: string, area: string) {
    Row({ space: 10 }) {
      Text(title)
      Text(area).layoutWeight(1).height("100%")
    }
    .width("90%")
    .borderRadius(6)
    .backgroundColor("#ccc")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
  }

  @Builder
  getCardAddressItem(obj: ObjInterface) {
    Row({ space: 10 }) {
      Text(obj.title)
      Text(obj.area).layoutWeight(1).height("100%")
    }
    .width("90%")
    .borderRadius(6)
    .backgroundColor("#ccc")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
  }

  build() {
    Column({ space: 10 }) {
      this.getCardValueItem("位置-值传递", this.area)
      this.getCardAddressItem({ title: "位置-引用传递", area: this.area })
      Button("点击修改位置").onClick(() => {
        this.area = "上海市"
        promptAction.showToast({ message: this.area.toString() })
      })
    }.height("100%").width("100%").backgroundColor("#fff")
  }
}

interface ObjInterface {
  title: string
  area: string
}