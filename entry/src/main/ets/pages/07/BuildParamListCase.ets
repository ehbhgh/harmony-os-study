import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct BuildParamListCase {
  @State isShow: boolean = false
  @Builder
  getHeader() {
    Row() {
      Text("头部区域").fontColor("#fff")
      Image($r("app.media.close")).fillColor("#fff").width(20).onClick(()=>{
        this.cancelDialog()
      })
    }
    .height(50)
    .width("100%")
    .backgroundColor("#2BB0A5")
    .padding(10)
    .borderRadius({
      topLeft: 6,
      topRight: 6
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  getContent() {
    Scroll() {
      Column() {
        Text("中间区域").fontColor("#fff")
      }.width("100%").padding(10)
    }.height(200).backgroundColor(Color.Pink)
  }

  cancelDialog(){
    promptAction.showToast({message:"取消了"})
    this.isShow=false
  }
  build() {
    Column() {
      Stack() {
        Button("点击显示弹框").onClick(()=>{
          this.isShow=true
        })
        if (this.isShow) {
          Dialog({
            header: () => {
              this.getHeader()
            },
            content: () => {
              this.getContent()
            },
            closeDialog:()=>{
              this.cancelDialog()
            }
          })
        }
      }

    }.width("100%").backgroundColor("#ccc").height("100%").justifyContent(FlexAlign.Center)
  }
}

@Component
struct Dialog {
  @Styles
  buttonStyleItem() {
    .backgroundColor("#2AB0A5").height(30).borderRadius(2)
  }

  @Builder
  getDefaultHeader() {
    Text("默认头部")
  }

  @Builder
  getDefaultContent() {
    Text("默认内容")
  }

  @BuilderParam
  header: () => void = this.getDefaultHeader
  @BuilderParam
  content: () => void = this.getDefaultContent
  closeDialog: () => void = () => {}
  build() {
    Column() {
      Column() {
        //头部
        Column() {
          this.header()
        }.borderRadius({
          topLeft: 6,
          topRight: 6
        })

        //中间部分
        Column() {
          this.content()
        }

        Row({ space: 10 }) {
          Button("确认").buttonStyleItem().type(ButtonType.Normal)
          Button("取消").buttonStyleItem().type(ButtonType.Normal).onClick(()=>{
            this.closeDialog()
          })
        }.height(60).justifyContent(FlexAlign.End).width("100%").padding(10)

      }
      .borderRadius(6)
      .width("100%")
      .backgroundColor("#fff")
      .justifyContent(FlexAlign.Center)
    }.padding(10)
  }
}