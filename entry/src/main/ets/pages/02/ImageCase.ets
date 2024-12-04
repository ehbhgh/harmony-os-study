@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World';
@State ImageList:string[]=["app.media.item1","app.media.item2","app.media.item3"]
  build() {
   Column(){
     ForEach(this.ImageList,(item:string,index:number)=>{
       Image($r(`app.media.item`+index)).width(60).height(60).margin(10)
     },(item: string) => item)

   }
  }
}