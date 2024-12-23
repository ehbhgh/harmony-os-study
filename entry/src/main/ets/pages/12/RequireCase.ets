@Entry
@Component
struct RequireCase {
  @State num: number = 0;

  build() {
    Row() {
      Column() {
        RequireChild({num:this.num}).margin(20)
        Button("父组件改变子组件").onClick(()=>{
          this.num++
        })
      }.width("100%")
    }.height("100%")

  }
}

@Component
struct RequireChild {
  @Require
  @Prop num:number
  build() {
    Column() {
      Text("子组件"+this.num)
    }
  }
}