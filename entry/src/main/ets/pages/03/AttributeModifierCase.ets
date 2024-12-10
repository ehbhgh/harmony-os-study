import { MyButtonModifier } from '../../Attr/MyButtonModifier'

@Entry
@Component
struct AttributeModifierCase {
  // 支持用状态装饰器修饰，行为和普通的对象一致
  @State alipayModifier: MyButtonModifier = new MyButtonModifier("alipay");
  @State wechatModifier: MyButtonModifier = new MyButtonModifier("wechat");
  aboutToAppear() {

  }
  // 组件生命周期
  build() {
    Column({space:10}) {
      Button("微信支付")
        .attributeModifier(this.wechatModifier)
      Button("支付宝支付")
        .attributeModifier(this.alipayModifier)
    }.width("100%")
  }
}