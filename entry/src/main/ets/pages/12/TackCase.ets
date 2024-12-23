@Entry
@Component
struct TackCase {
  @State message: string = 'Hello World';
  @State people: PeopleModel = new PeopleModel({
    name: "ws",
    age: 23,
    sex: "男"
  })

  build() {
    Column({ space: 20 }) {
      Text("姓名:" + this.people.name)
      Text("年龄:" + this.people.age)
      Text("性别:" + this.people.sex)
      Button("修改姓名").onClick(()=>{
        this.people.name="qy"
      })
      Button("修改年龄").onClick(()=>{
        this.people.age++
      })
      Button("修改性别").onClick(()=>{
        this.people.sex="女"
      })
    }.width("100%")
  }
}


interface People {
  name: string
  age: number
  sex: "男" | "女"
}


export class PeopleModel implements People {
  @Track
  name: string = ''
  @Track
  age: number = 0
  @Track
  sex: "男" | "女" = "男"

  constructor(model: People) {
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
  }
}
