@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World';
@State ImageList:string[]=["item1","item2","item3"]
  build() {
   Column(){
     ForEach(this.ImageList,(item:string,index:number)=>{
       Image($rawfile(`item${index+1}.png`)).width(60).height(60).margin(20)
     },(item: string) => item)
   }
  }
}