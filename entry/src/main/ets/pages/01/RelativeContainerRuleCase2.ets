@Entry
@Component
struct RelativeContainerRuleCase2 {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        RelativeContainer() {
          //当前元素的左边与锚点元素的左边起始位置对齐
          Text("Left-Start").width(100).height(50).fontColor("#fff").backgroundColor(Color.Green).alignRules({
            left:{anchor:"__container__",align:HorizontalAlign.Start}
          })
          //当前元素的左边与锚点元素的中间位置对齐
          Text("Left-Center").width(100).height(50).fontColor("#fff").backgroundColor(Color.Green).alignRules({
            left:{anchor:"__container__",align:HorizontalAlign.Center}
          })
          //当前元素的左边与锚点元素的右边结束位置对齐
          Text("Left-End").width(100).height(50).fontColor("#fff").backgroundColor(Color.Green).alignRules({
            left:{anchor:"__container__",align:HorizontalAlign.End},

          })
          //当前元素的中间位置与锚点元素的左边起始位置对齐
          Text("Middle-Start").width(100).height(50).fontColor("#fff").backgroundColor(Color.Blue).alignRules({
            middle:{anchor:"__container__",align:HorizontalAlign.Start},
            center:{anchor:"__container__",align:VerticalAlign.Center}
          })
          //当前元素的中间位置与锚点元素的中间位置对齐
          Text("Middle-Center").width(100).height(50).fontColor("#fff").backgroundColor(Color.Blue).alignRules({
            middle:{anchor:"__container__",align:HorizontalAlign.Center},
            center:{anchor:"__container__",align:VerticalAlign.Center}
          })
          //当前元素的中间位置与锚点元素的右边结束位置对齐
          Text("Middle-End").width(100).height(50).fontColor("#fff").backgroundColor(Color.Blue).alignRules({
            middle:{anchor:"__container__",align:HorizontalAlign.End},
            center:{anchor:"__container__",align:VerticalAlign.Center}
          })
          //当前元素的右边与锚点元素的左边起始位置对齐
          Text("Right-Start").width(100).height(50).textAlign(TextAlign.End).fontColor("#fff").backgroundColor(Color.Red).alignRules({
            right:{anchor:"__container__",align:HorizontalAlign.Start},
            bottom:{anchor:"__container__",align:VerticalAlign.Bottom},

          })
          //当前元素的右边与锚点元素的中间位置对齐
          Text("Right-Center").width(100).height(50).textAlign(TextAlign.End).fontColor("#fff").backgroundColor(Color.Red).alignRules({
            right:{anchor:"__container__",align:HorizontalAlign.Center},
            bottom:{anchor:"__container__",align:VerticalAlign.Bottom},

          })
          //当前元素的右边与锚点元素的右边结束位置对齐
          Text("Right-End").width(100).height(50).textAlign(TextAlign.End).fontColor("#fff").backgroundColor(Color.Red).alignRules({
            right:{anchor:"__container__",align:HorizontalAlign.End},
            bottom:{anchor:"__container__",align:VerticalAlign.Bottom},

          })
        }.width("60%").height(400).backgroundColor(Color.Pink)
      }.width("100%")
    }.height("100%")
  }
}