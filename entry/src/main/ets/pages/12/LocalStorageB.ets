import { PersonLocal, local } from "./common"
import { router } from '@kit.ArkUI'

@Entry(local)
@Component
struct LocalStorageB {
  @LocalStorageLink("user")
  person: PersonLocal = new PersonLocal()

  build() {
    Column() {
      Text(this.person.userName)
      Button("修改名称与年龄").onClick(()=>{
        this.person.age++
        this.person.userName="wxl"
        router.back()
      })
    }
  }
}