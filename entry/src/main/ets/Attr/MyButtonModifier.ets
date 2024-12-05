export class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  private type: string = "wechat"


  changeType(type: string) {

    this.type = type;
    console.log(this.type+"ws")
    return this
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    // instance为Button的属性对象，可以通过instance对象对属性进行修改
    instance.type(ButtonType.Normal)
      .fontColor("#fff")
      .width("80%")
      .height(50)
      .borderRadius(4)
    if (this.type == "wechat") {
      instance.backgroundColor("#00c168")
    } else {
      instance.backgroundColor("#ff125e0")
    }
  }
}