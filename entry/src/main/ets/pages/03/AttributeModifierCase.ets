import { MyButtonModifier } from '../../Attr/MyButtonModifier'

@Entry
@Component
struct AttributeModifierCase {
  // 支持用状态装饰器修饰，行为和普通的对象一致
  @State modifier: MyButtonModifier = new MyButtonModifier();
  aboutToAppear() {

  }
  // 组件生命周期
  build() {
    Column() {
      Button("微信支付")
        .attributeModifier(this.modifier.changeType("ali"))

    }.width("100%")
  }
}