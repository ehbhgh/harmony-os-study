import { PersonLocal, local } from "./common"
import { router } from '@kit.ArkUI'

@Entry(local)
@Component
struct LocalStorageA {
  @LocalStorageProp("user")
  user: PersonLocal = new PersonLocal()

  build() {
    Column() {
      Text(this.user.userName + ":"+this.user.age)
      Button("跳转").onClick(()=>{
        router.pushUrl({
          url:"pages/12/LocalStorageB"
        })
      })
    }
  }
}