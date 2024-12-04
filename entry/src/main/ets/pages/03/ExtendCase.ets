import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ExtendCase {
  build() {
    Column({ space: 10 }) {
      Button("支付宝支付").payButton("alipay")
      Button("微信支付").payButton("wechat")
      Button("支付宝支付").payButton("alipay")
      Button("微信支付").payButton("wechat")
      Button("支付宝支付").payButton("alipay")
      Button("微信支付").payButton("wechat")
    }.padding(10).width("100%")
  }
}

@Extend(Button)
function payButton(type: string) {
  .type(ButtonType.Normal)
  .fontColor("#fff")
  .width("80%")
  .height(50)
  .borderRadius(4)
  .backgroundColor(type === "wechat" ? "#00c168" : "#ff125e0").onClick(()=>{
    if(type==="wechat"){
      promptAction.showToast({message:"微信支付"})
    }
    else{
      promptAction.showToast({message:"支付宝支付"})
    }
  })
}