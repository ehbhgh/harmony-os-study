export interface GoodsItem{
  goodsId: string
  goodsDesc: string
  goodsName: string
  goodsUrl: ResourceStr
  goodsPrice: number
}
export class GoodsItemModel implements GoodsItem {
  goodsId: string = ''
  goodsDesc: string = ''
  goodsName: string = ''
  goodsUrl: ResourceStr = ''
  goodsPrice: number = 0

  constructor(model: GoodsItem) {
    this.goodsId = model.goodsId
    this.goodsDesc = model.goodsDesc
    this.goodsName = model.goodsName
    this.goodsUrl = model.goodsUrl
    this.goodsPrice = model.goodsPrice
  }
}
