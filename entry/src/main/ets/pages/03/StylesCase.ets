@Styles
function payStyle() {
  .width("100%")
  .height(50)
  .borderRadius(4)
  .backgroundColor('#00c168')
  .onClick(() => {
    console.log('全局使用@styles')
  })
}


@Entry
@Component
struct StylesCase {
  @Styles
  payStyleItem() {
    .width("100%")
    .height(50)
    .borderRadius(4)
    .backgroundColor(Color.Blue)
    .onClick(() => {
      console.log('组件内使用@styles')
    })
  }

  build() {
    Column({ space: 20 }) {
      Row() {
        Button("微信支付").payStyle().fontColor("#ffffff").type(ButtonType.Normal)
      }.padding(20)

      Row() {
        Button("微信提交").payStyle().fontColor("#ffffff").type(ButtonType.Normal)
      }.padding(20)


      Row() {
        Button("微信上报").payStyleItem().fontColor("#ffffff").type(ButtonType.Normal)
      }.padding(20)

      Row() {
        Button("微信下发").payStyleItem().fontColor("#ffffff").type(ButtonType.Normal)
      }.padding(20)
    }
  }
}