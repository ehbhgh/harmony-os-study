@Entry
@Component
struct ObjUpdateCase {
  @State message: string = 'Hello World';
  @State Person: PersonInterfaceModel = new PersonInterfaceModel({
    name: '',
    age: 0,
    address: {
      province: "江苏省",
      city: "南京市",
      area: '浦口区'
    }
  })

  build() {
    Column() {
      Text("省：" + this.Person.address.province)
      Text("市：" + this.Person.address.city)
      Text("区：" + this.Person.address.area)
      Button("修改地域").onClick(() => {
        //直接修改修改不了，鸿蒙只能修改object中的第一层也就是Object.keys的第一层
        this.Person.address.province = "安徽省"
        this.Person.address=new addressInterfaceModel(this.Person.address)
      })
    }
  }
}

interface PersonInterface {
  name: string;
  age: number;
  address: addressInterface
}

interface addressInterface {
  province: string;
  city: string;
  area: string
}

export class PersonInterfaceModel implements PersonInterface {
  name: string = ''
  age: number = 0
  address: addressInterface = new addressInterfaceModel({} as addressInterface)

  constructor(model: PersonInterface) {
    this.name = model.name
    this.age = model.age
    this.address = model.address
  }
}

export class addressInterfaceModel implements addressInterface {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: addressInterface) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}
