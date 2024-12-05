@Entry
@Component
struct ConditionCase {
  @State showImg: boolean = true

  build() {
    Row() {
      Scroll() {
        Column() {
          Toggle({ type: ToggleType.Switch, isOn: $$this.showImg }).margin(10)
          //使用if else
          if (this.showImg) {
            Image($r("app.media.mine")).width(150).height(150)
          }
          //宽高透明度
          Image($r("app.media.mine")).width(this.showImg ? 150 : 0).height(this.showImg ? 150 : 0).margin({
            top: 20
          })
          //选择None不占位隐藏
          Image($r("app.media.mine")).width(150).height(150).margin({
            top: 20
          }).visibility(this.showImg ? Visibility.Visible : Visibility.None)

          //占位隐藏
          Image($r("app.media.mine")).width(150).height(150).margin({
            top: 20
          }).opacity(this.showImg ? 1 : 0)
          //选择Hidden占位隐藏
          Image($r("app.media.mine")).width(150).height(150).margin({
            top: 20
          }).visibility(this.showImg ? Visibility.Visible : Visibility.Hidden)

        }.width("100%")
      }

    }.width("100%").height("100%")
  }
}