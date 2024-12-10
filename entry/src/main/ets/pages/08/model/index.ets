export interface WsListInterface {
  goodsDesc: string
  goodsName: string
  goodsUrl: ResourceStr,
  goodsPrice: number,
  goodsId: string
}

export class WsListModel implements WsListInterface {
  goodsDesc: string = ''
  goodsName: string = ''
  goodsUrl: ResourceStr = ''
  goodsPrice: number = 0
  goodsId: string = ""

  constructor(model: WsListInterface) {
    this.goodsDesc = model.goodsDesc
    this.goodsName = model.goodsName
    this.goodsUrl = model.goodsUrl
    this.goodsPrice = model.goodsPrice
    this.goodsId = model.goodsId
  }
}