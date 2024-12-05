import { Loading } from "./components/Loading"

@Entry
@Component
struct LoadingCase {
  @State isShow: boolean = false
  timer: number = -1

  aboutToAppear(): void {
    this.isShow = true;
    this.timer = setTimeout(() => {
      this.isShow = false
    }, 3000)
  }

  aboutToDisappear(): void {
    clearTimeout(this.timer)
    this.timer = -1
  }

  build() {
   Row(){
     Column() {
       if (this.isShow) {
         Loading()
       }

     }.width("100%")
   }.height("100%")
  }
}