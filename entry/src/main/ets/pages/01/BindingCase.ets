@Entry
@Component
struct BindingCase {
  @State message: string = 'Hello World';
  @State isMarry: boolean = false
  @State searchTxt: string = ""
  @State txt: string = ""
  @State selectedDate: Date = new Date('2021-08-08')

  changeDate(dateStr: Date) {
    const newDate = new Date(dateStr)
    return newDate.toLocaleString()
  }

  build() {
    Grid() {
      GridItem() {
        Column() {
          Text("Checkbox的双向绑定")
          Checkbox().select($$this.isMarry)
          Text(this.isMarry + "")
          Button("点击更换").onClick(() => {
            this.isMarry = !this.isMarry
          })
        }
      }.backgroundColor(Color.Pink).height(200).borderRadius(6)

      GridItem() {
        Column() {
          Text("Search的双向绑定")
          Search({ value: $$this.searchTxt })
          Text(this.searchTxt + "")
          Button("修改值").onClick(() => {
            this.searchTxt = "ws"
          })
        }
      }.backgroundColor(Color.Pink).height(200).borderRadius(6)

      GridItem() {
        Column() {
          Text("TextInput的双向绑定")
          TextInput({ text: $$this.txt })
          Text(this.txt + "")
          Button("点击更换").onClick(() => {
            this.txt = "qy"
          })
        }
      }.backgroundColor(Color.Pink).height(200).borderRadius(6)

      GridItem() {
        Column() {
          Text("DatePicker的双向绑定")
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
            selected: $$this.selectedDate
          }).height(100).width(150)
          Text(this.changeDate(this.selectedDate) + "")
          Button("点击").onClick(() => {
            console.log(this.changeDate(this.selectedDate) + "")
          })
        }
      }.backgroundColor(Color.Pink).height(200).borderRadius(6)
    }.columnsTemplate("1fr 1fr").columnsGap(10).rowsGap(10).margin(10)

  }
}