export interface ReplyItem {
  id: number
  avatar: ResourceStr
  author: string
  content: string
  time: string
  area: string
  likeNum: number
  likeFlag: boolean | null
}

export class ReplyItemModel implements ReplyItem {
  id: number = 0
  avatar: ResourceStr = ''
  author: string = ''
  content: string = ''
  time: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag: boolean | null = null

  constructor(model: ReplyItem) {
    this.id = model.id
    this.avatar = model.avatar
    this.author = model.author
    this.content = model.content
    this.time = model.time
    this.area = model.area
    this.likeNum = model.likeNum
    this.likeFlag = model.likeFlag
  }
}
