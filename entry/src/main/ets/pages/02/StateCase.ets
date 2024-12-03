@Entry
@Component
struct StateCase {
  @State message: string = 'Hello World';
  @State userInfo: UserInfoInterfaceModel = new UserInfoInterfaceModel({
    age: 1,
    name: "ws",
    sex: "男",
    address: ["江苏省", "南京市", "鼓楼区"]
  })
  @State sexIndex: number = 0
  private cascade: TextCascadePickerRangeContent[] = [
    {
      text: '辽宁省',
      children: [{ text: '沈阳市', children: [{ text: '沈河区' }, { text: '和平区' }, { text: '浑南区' }] },
        { text: '大连市', children: [{ text: '中山区' }, { text: '金州区' }, { text: '长海县' }] }]
    },
    {
      text: '吉林省',
      children: [{ text: '长春市', children: [{ text: '南关区' }, { text: '宽城区' }, { text: '朝阳区' }] },
        { text: '四平市', children: [{ text: '铁西区' }, { text: '铁东区' }, { text: '梨树县' }] }]
    },
    {
      text: '黑龙江省',
      children: [{ text: '哈尔滨市', children: [{ text: '道里区' }, { text: '道外区' }, { text: '南岗区' }] },
        { text: '牡丹江市', children: [{ text: '东安区' }, { text: '西安区' }, { text: '爱民区' }] }]
    },
    {
      text: '江苏省',
      children: [{
        text: '南京市',
        children: [{ text: '玄武区' }, { text: '雨花台区' }, { text: '鼓楼区' }, { text: '浦口区' }]
      },
        {
          text: '无锡市',
          children: [{ text: '锡山区' }, { text: '新吴区' }, { text: '惠山区' }, { text: '梁溪区' }, { text: '滨湖区' }]
        }, {
          text: '常州市',
          children: [{ text: '武进区' }, { text: '溧阳市' }, { text: '金坛区' }, { text: '天宁区' }, { text: '钟楼区' }]
        }, {
          text: '苏州市',
          children: [{ text: '姑苏区' }, { text: '吴中区' }, { text: '相城区' }, { text: '工业园区' },
            { text: '高新区' }]
        }]
    }
  ]
  private sexList: Array<SexItem> = [{
    value: "男",
    icon: $r("app.media.arrow")
  }, {
    value: "女",
    icon: $r("app.media.arrow")
  }]

  onSubmitUserInfo() {
    console.log(JSON.stringify(this.userInfo))
  }

  changeName() {
    this.userInfo.name = "qyqyqy"
    this.userInfo.age++
    this.userInfo.sex = this.userInfo.sex === "男" ? "女" : "男"
    this.userInfo.address=["江苏省","无锡市","惠山区"]
  }

  build() {

    Column({ space: 20 }) {
      Row() {
        Text("姓名:").width(40).height(40)
        TextInput({ placeholder: "请输入姓名", text: this.userInfo.name })
          .layoutWeight(1)
          .height(40)
          .onChange((val) => {
            this.userInfo.name = val
          })
      }.alignItems(VerticalAlign.Center).width("100%")

      Row() {
        Text("年龄:").width(40).height(40)
        TextInput({ placeholder: "请输入年龄", text: this.userInfo.age.toString() })
          .layoutWeight(1)
          .height(40)
          .type(InputType.Number)
          .onChange((val) => {
            this.userInfo.age = Number(val)
          })
      }.alignItems(VerticalAlign.Center).width("100%")

      Row() {
        Text("性别:").width(40).height(40)
        Select(this.sexList)
          .selected(this.sexIndex)
          .value(this.userInfo.sex)
          .onSelect((index: number, text?: string | undefined) => {
            this.sexIndex = index
            if (text) {
              this.userInfo.sex = text
            }
          })
          .layoutWeight(1)
          .height(40)
      }.alignItems(VerticalAlign.Center).width("100%")

      Row() {
        Text("地址:").width(40).height(40)
        TextPicker({ range: this.cascade, value: this.userInfo.address })
          .onChange((value: string | string[]) => {
            if (Array.isArray(value) && value.length > 0) {
              this.userInfo.address = value
            }
          }).layoutWeight(1)
          .height(40)
      }.alignItems(VerticalAlign.Center).width("100%")

      Row() {
        Button("提交").width("95%")
      }.alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center).onClick(() => {
        this.onSubmitUserInfo()
      })

      Row() {
        Button("修改").width("95%").backgroundColor(Color.Orange)
      }.alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center).onClick(() => {
        this.changeName()
      })
    }.width("100%").padding(10)
  }
}


interface UserInfoInterface {
  name: string;
  age: number;
  sex: string;
  address: string[]
}

interface SexItem {
  value: string;
  icon: Resource
}

export class UserInfoInterfaceModel implements UserInfoInterface {
  name: string = ''
  age: number = 0
  sex: string = ''
  address: string[] = []

  constructor(model: UserInfoInterface) {
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
    this.address = model.address
  }
}

