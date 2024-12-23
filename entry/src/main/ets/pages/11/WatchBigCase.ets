import {QuestionInfoModel, OptionItemModel, UserAnswerModel } from "./model"


@Entry
@Component
struct WatchBigCase {
  @State list: QuestionInfoModel[] = []
  @State currentIndex: number = 0
  @State answerMap: Map<number, UserAnswerModel> = new Map()

  aboutToAppear(): void {
    this.getQuestionInfoList()
  }

  async getQuestionInfoList() {
    this.list = await new Promise<QuestionInfoModel[]>((resolve) => {
      setTimeout(() => {
        resolve([
          new QuestionInfoModel({
            id: 1,
            title: "任何人发现有违反《国家电网公司电力安全工作规程（信息部分）》的情况。应（），经纠正后方可恢复作业",
            type: "单选题",
            options: [
              new OptionItemModel({
                letter: "A",
                optionTitle: "批评教育"
              }),
              new OptionItemModel({
                letter: "B",
                optionTitle: "严肃指出"
              }),
              new OptionItemModel({
                letter: "C",
                optionTitle: "立即汇报"
              }),
              new OptionItemModel({
                letter: "D",
                optionTitle: "立即制止"
              }),
            ]
          }),
          new QuestionInfoModel({
            id: 2,
            title: "根据信息安规规定，工作前，作业人员应进行身份（）和（）",
            type: "单选题",
            options: [
              new OptionItemModel({
                letter: "A",
                optionTitle: "鉴别、认证"
              }),
              new OptionItemModel({
                letter: "B",
                optionTitle: "鉴别、授权"
              }),
              new OptionItemModel({
                letter: "C",
                optionTitle: "验证、授权"
              }),
              new OptionItemModel({
                letter: "D",
                optionTitle: "验证、备案"
              }),
            ]
          }),
          new QuestionInfoModel({
            id: 3,
            title: "根据信息安规规定，业务系统下线后，所有数据应（）或销毁",
            type: "单选题",
            options: [
              new OptionItemModel({
                letter: "A",
                optionTitle: "导出"
              }),
              new OptionItemModel({
                letter: "B",
                optionTitle: "备份"
              }),
              new OptionItemModel({
                letter: "C",
                optionTitle: "归档"
              }),
              new OptionItemModel({
                letter: "D",
                optionTitle: "妥善保存"
              }),
            ]
          }),
          new QuestionInfoModel({
            id: 4,
            title: "根据信息安规规定，机房及（）的接地电阻、过电压保护性能，应符合有关标准、规范的要求",
            type: "单选题",
            options: [
              new OptionItemModel({
                letter: "A",
                optionTitle: "生产设备"
              }),
              new OptionItemModel({
                letter: "B",
                optionTitle: "安全设施"
              }),
              new OptionItemModel({
                letter: "C",
                optionTitle: "办公场所"
              }),
              new OptionItemModel({
                letter: "D",
                optionTitle: "相关设施"
              }),
            ]
          })
        ])
      }, 300)
    })
  }

  //上一题
  lastQuestion() {
    if (this.getLastEnable()) {
      this.currentIndex--
    }
  }

  getLastEnable() {
    return this.currentIndex > 0
  }

  //下一题
  nextQuestion() {
    if (this.getNextEnable()) {
      this.currentIndex++
    }
  }

  getNextEnable() {
    return this.currentIndex < this.list.length - 1
  }

  getCurrentIndexOption() {
    if (this.list.length) {
      return this.list[this.currentIndex]
    }
    return null
  }

  selectAnswer(option: OptionItemModel) {
    //拿到当前题目
    const question = this.getCurrentIndexOption()
    if (question) {
      const answerModel = new UserAnswerModel({
        questionId: question.id,
        userAnswer: option.letter,
        userId: "123456"
      })
      this.answerMap.set(question.id, answerModel)
    }

  }

  //根据当前是否被选中
  getColor(option: OptionItemModel, type: "bgColor" | "fontColor" = "bgColor") {
    //拿到当前题目
    const question = this.getCurrentIndexOption()
    if (question) {
      const userAnswer = this.answerMap.get(question.id)?.userAnswer
      if (userAnswer === option.letter) {
        return type === "bgColor" ? "#0082F7" : "#ffffff"
      }
    }
    return type === "bgColor" ? "#f9f9f9" : "#000"
  }

  @Styles
  iconStyle(){
    .width(20).height(20)
  }

  @Builder
  getTopBuilder() {
    Row() {
      Image($r("app.media.left_arrow")).iconStyle()
      Text("在线模拟")
      Image($r("app.media.editor_txt")).iconStyle().fillColor("#909090")
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width("100%")
    .height(40)
    .padding({
      left: 10,
      right: 10
    })
    .backgroundColor("#fff")
  }

  @Builder
  getContentBuilder() {
    Column() {
      Column({ space: 10 }) {
        Text(this.getCurrentIndexOption()?.type)
          .backgroundColor("#F6F7F9")
          .width(60)
          .height(30)
          .borderRadius(10)
          .fontColor("#A3A2A5")
          .textAlign(TextAlign.Center)
        Text(this.getCurrentIndexOption()?.title).fontSize(16)
        Column({ space: 10 }) {
          ForEach(this.getCurrentIndexOption()?.options, (item: OptionItemModel) => {
            Row({ space: 10 }) {
              Text(item.letter + ".").fontColor(this.getColor(item, "fontColor"))
              Text(item.optionTitle).fontColor(this.getColor(item, "fontColor"))
            }
            .width("100%")
            .height(40)
            .backgroundColor(this.getColor(item))
            .padding(10)
            .onClick(() => {
              this.selectAnswer(item)
            })
          })
        }.width("100%").padding(10).alignItems(HorizontalAlign.Start)
      }.width("100%").padding({
        left: 10,
        right: 10,
        bottom: 20,
        top: 20
      }).backgroundColor("#fff").alignItems(HorizontalAlign.Start)

      Column() {

      }.width("100%")
    }.width("100%")
  }

  @Builder
  getBottomBuilder() {
    Row() {
      Row({ space: 10 }) {
        Image($r("app.media.left_arrow")).iconStyle().fillColor(this.getLastEnable() ? "#000" : "#DBDBDB")
        Text("上一题").fontColor(this.getLastEnable() ? "#000" : "#DBDBDB")
      }.onClick(() => {
        this.lastQuestion()
      })

      Row({ space: 10 }) {
        Text("下一题").fontColor(this.getNextEnable() ? "#000" : "#DBDBDB")
        Image($r("app.media.left_arrow")).iconStyle().rotate({
          angle: 180
        }).fillColor(this.getNextEnable() ? "#000" : "#DBDBDB")
      }.onClick(() => {
        this.nextQuestion()
      })
    }
    .width("100%")
    .backgroundColor("#fff")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 10,
      right: 10
    })
  }

  build() {
    Column() {
      this.getTopBuilder()
      ProgressItem({
        total: this.list.length,
        currentIndex: this.currentIndex
      })
      Column() {
        this.getContentBuilder()
      }.layoutWeight(1)

      this.getBottomBuilder()

    }.width("100%").backgroundColor("#F5F7F9")
  }
}


@Component
struct ProgressItem {
  @Prop
  total: number = 0
  @Prop
  currentIndex: number = 0

  build() {
    Row() {
      Progress({ value: this.currentIndex + 1, total: this.total }).width("90%")
      Row() {
        Text((this.currentIndex + 1).toString())
        Text(`/${this.total}`).fontColor("#aaa")
      }.margin({
        left: 10
      })
    }.width("100%").padding({
      left: 10,
      right: 10
    }).backgroundColor("#fff").height(60)
  }
}