import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct ProvideBigCase {
  @State password: string = "123456"
  @State mobile: string = "13329111665"

  getBtnDisabled() {
    return this.password !== "" && this.mobile !== ""
  }

  login() {
    if (this.password === "123456" && this.mobile === "13329111665") {
      router.pushUrl({
        url: "pages/10/ProvideMainCase"
      })
    }
    else{
      promptAction.showToast({message:"手机号或密码错误"})
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image($r("app.media.question")).width(60).height(60)
        Text("欢迎使用鸿蒙刷题")
        TextInput({ placeholder: "请输入手机号", text: $$this.mobile }).width("90%").type(InputType.PhoneNumber)
        TextInput({ placeholder: "请输入密码", text: $$this.password }).type(InputType.Password).width("90%")
        Button("登录")
          .type(ButtonType.Normal)
          .width("88%")
          .borderRadius(10)
          .height(40)
          .enabled(this.getBtnDisabled())
          .onClick(() => {
            this.login()
          }).backgroundColor("#20862D")
      }.justifyContent(FlexAlign.Center).width("100%")
    }.height("100%")
  }
}