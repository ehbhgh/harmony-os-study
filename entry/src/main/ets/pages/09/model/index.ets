export interface BookItemInterface{
  book_id:string
  book_price:string
  book_name:string
  book_num:string
}
export class BookItemInterfaceModel implements BookItemInterface {
  book_id: string = ''
  book_price: string = ""
  book_name: string = ''
  book_num: string = ""

  constructor(model: BookItemInterface) {
    this.book_id = model.book_id
    this.book_price = model.book_price
    this.book_name = model.book_name
    this.book_num = model.book_num
  }
}