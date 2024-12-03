import { promptAction } from '@kit.ArkUI';

interface UserInterface {
  userName: string;
  password: string

}

@Entry
@Component
struct EventCase {
  @State userName: string = '';
  @State password: string = '';

  private login() {
    const user: UserInterface = {
      userName: this.userName,
      password: this.password
    }
    if (this.userName !== "admin" || this.password !== "123456") {
      promptAction.showToast({ message: '账号和密码错误！', bottom: 300 })
      return
    }
    promptAction.showToast({ message: JSON.stringify(user), bottom: 300 })
  }

  private enabledChange() {
    return this.password !== "" && this.userName !== ""
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ text: $$this.userName, placeholder: "请输入用户名" }).width("90%").height(40).onChange((val) => {
          console.log(val)
        })
        TextInput({ text: $$this.password, placeholder: "请输入密码" })
          .type(InputType.Password)
          .width("90%")
          .height(40)
          .onChange((val) => {
            console.log(val)
          })
          .onSubmit(() => {
            this.login()
          })
        Button("登录").width("90%").borderRadius(10).onClick(() => {
          this.login()
        }).enabled(this.enabledChange())
      }.width("100%")
    }.height("100%")

  }
}