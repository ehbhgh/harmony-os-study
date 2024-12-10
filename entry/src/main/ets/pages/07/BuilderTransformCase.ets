import { FormParams, positionInterface, typeInterface, FormParamsModel } from "./model"
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct BuilderTransformCase {
  @State form: FormParams = {
    city: "南京",
    time: new Date("2024-12-09"),
    errorType: "资源加载错误"
  }
  @State positionList: positionInterface[] = [{
    value: "北京",
    name: "1"
  }, {
    value: "上海",
    name: "2"
  }, {
    value: "南京",
    name: "3"
  }, {
    value: "广州",
    name: "4"
  }, {
    value: "深圳",
    name: "5"
  }]
  @State typeList: typeInterface[] = [{
    value: "网络错误",
    name: "1"
  }, {
    value: "资源加载错误",
    name: "2"
  }, {
    value: "参数错误",
    name: "3"
  }, {
    value: "脚本语法错误",
    name: "4"
  }, {
    value: "app版本错误",
    name: "5"
  }]


  @Builder
  getItemCard($$: FormParams, type: string) {
    Row({ space: 10 }) {
      Text(type + ":")
      if (type === "位置") {
        Select(this.positionList)
          .value($$.city)
          .layoutWeight(1)
          .height(40)
          .backgroundColor("#fff")
          .onSelect((index: number, value?: string) => {
            if (value) {
              this.form = new FormParamsModel({
                city: value,
                time: this.form.time,
                errorType: this.form.errorType
              })
            }
          })
      } else if (type === "类型") {
        Select(this.typeList)
          .value($$.errorType)
          .layoutWeight(1)
          .height(40)
          .backgroundColor("#fff")
          .onSelect((index: number, value?: string) => {
            if (value) {
              this.form = new FormParamsModel({
                city: this.form.city,
                time: this.form.time,
                errorType: value
              })
            }
          })
      } else {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: $$.time
        })
          .lunar(false)
          .backgroundColor("#fff")
          .layoutWeight(1)
          .height(40)
          .onDateChange((val: Date) => {
            if (val) {
              this.form = new FormParamsModel({
                city: this.form.city,
                time: val,
                errorType: this.form.errorType
              })
            }
          })
      }
    }
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
    .backgroundColor("#fff")
    .width("90%")
    .borderRadius(6)
  }

  build() {
    Column({ space: 20 }) {
      this.getItemCard({
        city: this.form.city,
        time: this.form.time,
        errorType: this.form.errorType
      }, "位置")
      this.getItemCard({
        city: this.form.city,
        time: this.form.time,
        errorType: this.form.errorType
      }, "时间")
      this.getItemCard({
        city: this.form.city,
        time: this.form.time,
        errorType: this.form.errorType
      }, "类型")
      Button("修改内容").onClick(() => {
        promptAction.showToast({ message: JSON.stringify(this.form) })
        this.form = new FormParamsModel({
          city: "北京",
          time: new Date("2024-12-08"),
          errorType: "网络错误"
        })
      })
    }
    .width("100%")
    .backgroundColor("#ccc")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}