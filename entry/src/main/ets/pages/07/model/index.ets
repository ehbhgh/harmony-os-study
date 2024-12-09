export interface GoodsItem{
  goodsId: string
  goodsDesc: string
  goodsName: string
  goodsUrl: ResourceStr
  goodsPrice: number
}

export interface FormParams{
  city:string
  time:Date
  errorType:string
}

export interface positionInterface{
  value:string
  name:string
}
export interface typeInterface{
  value:string
  name:string
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
export class FormParamsModel implements FormParams {
  city: string = ''
  time: Date = new Date()
  errorType: string = ''

  constructor(model: FormParams) {
    this.city = model.city
    this.time = model.time
    this.errorType = model.errorType
  }
}
export class positionInterfaceModel implements positionInterface {
  value: string = ''
  name: string = ''

  constructor(model: positionInterface) {
    this.value = model.value
    this.name = model.name
  }
}
export class typeInterfaceModel implements typeInterface {
  value: string = ''
  name: string = ''

  constructor(model: typeInterface) {
    this.value = model.value
    this.name = model.name
  }
}
