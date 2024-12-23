import { BookItemInterface, BookItemInterfaceModel } from "./model"
import { generateRandomString } from "./utils"
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct BookShopCase {
  @State bookList: BookItemInterface[] = [
    {
      book_id: generateRandomString(),
      book_name: "红楼梦",
      book_price: "102",
      book_num: "229"
    },
    {
      book_id: generateRandomString(),
      book_name: "西游记",
      book_price: "120",
      book_num: "103"
    },
    {
      book_id: generateRandomString(),
      book_name: "三国演义",
      book_price: "89",
      book_num: '310'
    },
    {
      book_id: generateRandomString(),
      book_name: "水浒传",
      book_price: "114",
      book_num: "203"
    }
  ]
  @State isShow: boolean = false
  @State form: BookItemInterface = new BookItemInterfaceModel({
    book_id: generateRandomString(),
    book_price: "",
    book_name: "",
    book_num: ""

  })
  @State playType: string = "add"
  //书籍总数
  @State bookTotalNum: number = 0
  //书籍总价格
  @State bookTotalPrice: number = 0

  //新增书籍
  addBook() {
    this.bookList.push(this.form)
    this.calculateBook()
    this.isShow = false
  }

  //删除书籍
  deleteBook(bookId: string) {
    if (this.bookList.length == 1) {
      promptAction.showToast({ message: "已经是最后一项了，无法删除!" })
      return
    }
    this.bookList = this.bookList.filter(item => item.book_id !== bookId)
    this.calculateBook()
  }

  //点击编辑按钮开始编辑
  openEditorBook(item: BookItemInterface) {
    this.playType = "editor"
    this.form = item
    this.isShow = true
  }

  //点击新增按钮
  openAddBook() {
    this.playType = "add"
    this.form = new BookItemInterfaceModel({
      book_id: generateRandomString(),
      book_price: "",
      book_name: "",
      book_num: ""
    })
    this.isShow = true
  }

  //编辑书籍
  editorBook(item: BookItemInterface) {
    const index = this.bookList.findIndex(book => book.book_id === item.book_id)
    this.bookList.splice(index, 1, item)
    this.calculateBook()
    this.isShow = false
  }

  //计算书籍总数和书籍总价格
  calculateBook() {
    this.bookTotalNum = this.bookList.reduce((sum: number, item: BookItemInterface) => {
      return sum + Number(item.book_num)
    }, 0)
    this.bookTotalPrice = this.bookList.reduce((sum: number, item: BookItemInterface) => {
      return sum + (Number(item.book_num) * Number(item.book_price))
    }, 0)
  }

  @Builder
  getFormBuilder() {
    BookDialog({
      isShow: this.isShow,
      submitForm: (item: BookItemInterface) => {
        if (this.playType === "add") {
          this.addBook()
        } else {
          this.editorBook(item)
        }
      },
      form: this.form,
    })
  }

  aboutToAppear(): void {
    this.calculateBook()
  }

  build() {
    Column() {
      Row() {
        Button("添加书籍").onClick(() => {
          this.openAddBook()
        }).type(ButtonType.Normal).borderRadius(6)
      }.width("100%").height(60).justifyContent(FlexAlign.End).padding(10)

      List() {
        ForEach(this.bookList, (item: BookItemInterface) => {
          ListItem() {
            BookItem({
              item,
              deleteBook: (bookId: string) => {
                this.deleteBook(bookId)
              },
              openEditorBook: (book: BookItemInterface) => {
                this.openEditorBook(book)
              },
              playType: this.playType
            })
          }
        })
      }.layoutWeight(1)

      Row({ space: 30 }) {
        Row({ space: 10 }) {
          Text(`书籍总数:`)
          Text(this.bookTotalNum + "本").fontColor(Color.Orange).fontWeight(600)
        }

        Row({ space: 10 }) {
          Text(`书籍价格:`)
          Text(`￥${this.bookTotalPrice}`).fontColor(Color.Red).fontWeight(600)
        }
      }.width("100%").backgroundColor("#ccc").height(60).padding(20)

    }.width("100%").bindSheet($$this.isShow, this.getFormBuilder(), { showClose: false, height: "50%" })
  }
}

@Component
struct BookItem {
  @Prop item: BookItemInterface = {} as BookItemInterface
  deleteBook: (bookId: string) => void = (bookId: string) => {
  }
  openEditorBook: (book: BookItemInterface) => void = (book: BookItemInterface) => {
  }
  @Link
  playType: string

  build() {
    Row() {
      Text(this.item.book_name).width(80)
      Row() {
        Text(`价格:`)
        Text(`￥${this.item.book_price}`).fontColor(Color.Red)
      }.width(90)

      Text(`数量:${this.item.book_num}`).width(70)
      Row({ space: 10 }) {
        Button() {
          Image($r("app.media.delete")).width(20).height(20).fillColor("#fff")
        }.width(30).height(30).onClick(() => {
          this.deleteBook(this.item.book_id)
        })

        Button() {
          Image($r("app.media.editor")).width(20).height(20).fillColor("#fff").onClick(() => {
            this.openEditorBook(this.item)
          })
        }.width(30).height(30)
      }.margin({ left: 30 })
    }.padding(10).width("100%")
  }
}

@Component
struct BookDialog {
  @Link
  isShow: boolean
  @Link
  form: BookItemInterface
  submitForm: (form: BookItemInterface) => void = (form: BookItemInterface) => {
  }

  build() {
    Column() {
      Column({ space: 20 }) {
        Row() {
          Text("书名:").width(50)
          TextInput({ placeholder: "请输入书名", text: this.form.book_name })
            .layoutWeight(1)
            .onChange((val: string) => {
              this.form.book_name = val
            })
        }

        Row() {
          Text("价格:").width(50)
          TextInput({ placeholder: "请输入价格", text: this.form.book_price })
            .layoutWeight(1)
            .type(InputType.Number).onChange((val: string) => {
            this.form.book_price = val
          })
        }

        Row() {
          Text("数量:").width(50)
          TextInput({ placeholder: "请输入数量", text: this.form.book_num })
            .layoutWeight(1)
            .type(InputType.Number)
            .onChange((val: string) => {
              this.form.book_num = val
            })
        }
      }.layoutWeight(1).width("100%").padding(10).margin({
        top: 30
      })

      Divider().width("100%").strokeWidth(1).backgroundColor("#ccc")
      Row() {
        Button("取消").type(ButtonType.Normal).onClick(() => {
          this.isShow = false
        }).backgroundColor(Color.Orange).borderRadius(6)
        Button("确认").type(ButtonType.Normal).borderRadius(6).onClick(() => {
          this.submitForm(this.form)
        })
      }.width("100%").height(100).justifyContent(FlexAlign.SpaceBetween).padding(20)
    }.width("100%")
  }
}
