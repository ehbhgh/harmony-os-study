export interface WorkRecord {
  companyName: string
  workDate: string
  workSalary: number | string
  workTitle: string
  workContent: string
}

export class WorkRecordModel implements WorkRecord {
  companyName: string = ''
  workDate: string = ''
  workSalary: string | number = 0
  workTitle: string = ''
  workContent: string = ''

  constructor(model: WorkRecord) {
    this.companyName = model.companyName
    this.workDate = model.workDate
    this.workSalary = model.workSalary
    this.workTitle = model.workTitle
    this.workContent = model.workContent
  }
}




export interface GoodsList{
  goodsDesc:string
  goodsName:string
  goodsUrl:string,
  goodsPrice:number,
  goodsId:string
}
export class GoodsListModel implements GoodsList {
  goodsDesc: string = ''
  goodsName: string = ''
  goodsUrl: string = ''
  goodsPrice: number = 0
  goodsId:string=""
  constructor(model: GoodsList) {
    this.goodsDesc = model.goodsDesc
    this.goodsName = model.goodsName
    this.goodsUrl = model.goodsUrl
    this.goodsPrice = model.goodsPrice
    this.goodsId=model.goodsId
  }
}