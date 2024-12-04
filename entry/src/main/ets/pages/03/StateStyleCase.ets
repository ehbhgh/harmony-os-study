@Entry
@Component
struct StateStyleCase {
  @State isDisabled:boolean=true
  build() {
    Column() {
      Row() {
        Text("你好吗").textAlign(TextAlign.Center).fontColor(Color.Black).width("100%")
      }
      .width("90%")
      .height(200)
      .border({
        width: 3,
        color: "#cccc"
      })
      .stateStyles({
        normal: {
          .backgroundColor("#fff")
        },
        //按压态
        pressed: {
          .backgroundColor(Color.Green)
        },
        //禁用态
        disabled: {
          .backgroundColor("#aaaaaa")
        }
      })
      .borderRadius(4).enabled(this.isDisabled)

      Button("禁用/启用").onClick(()=>{
        this.isDisabled=!this.isDisabled
      }).margin(20).type(ButtonType.Normal).borderRadius(6).width("90%")

      TextInput({placeholder:"请输入账号"}).margin(20).stateStyles({
        normal:{
          .border({
            width:0
          })
        },
        focused:{
          .border({
            width:2,
            color:Color.Red
          })
        }
      })
      TextInput({placeholder:"请输入密码"}).type(InputType.Password).margin(20).stateStyles({
        normal:{
          .border({
            width:0
          })
        },
        focused:{
          .border({
            width:2,
            color:Color.Red
          })
        }
      })
    }.width("100%")
  }
}