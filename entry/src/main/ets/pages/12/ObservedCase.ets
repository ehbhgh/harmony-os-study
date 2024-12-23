@Entry
@Component
struct ObservedCase {
  @State commentList: CommentModel[] = [
    new CommentModel({
      commentContent: "今天天气不错，我想出去玩",
      author: "ws",
      likeNum: 100,
      imgUrl:$r("app.media.pic11")
    }),
    new CommentModel({
      commentContent: "今天天气不错，我只想学习",
      author: "qy",
      likeNum: 230,
      imgUrl:$r("app.media.pic12")
    })
  ]

  build() {
    List({ space: 20 }) {
      ForEach(this.commentList, (item: CommentModel) => {
        ListItem() {
          //这个地方不支持es6
          CommentItem({ item:item })
        }
      })
    }.width("100%").padding(20)
  }
}


@Component
struct CommentItem {
  @ObjectLink
  item: CommentModel

  build() {
    Row({ space: 20 }) {
      Image(this.item.imgUrl).width(30).height(30).borderRadius(15)
      Text(this.item.author)
      Text(this.item.commentContent)
      Text(this.item.likeNum + "").onClick(()=>{
        this.item.likeNum++
      })
    }
    .width("100%")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius(10)
    .backgroundColor("#f4f4f4").padding(10)
  }
}

interface Comment {
  commentContent: string
  likeNum: number
  author: string
  imgUrl:ResourceStr
}

@Observed
export class CommentModel implements Comment {
  commentContent: string = ''
  likeNum: number = 0
  author: string = ''
  imgUrl: ResourceStr = ''

  constructor(model: Comment) {
    this.commentContent = model.commentContent
    this.likeNum = model.likeNum
    this.author = model.author
    this.imgUrl = model.imgUrl
  }
}
