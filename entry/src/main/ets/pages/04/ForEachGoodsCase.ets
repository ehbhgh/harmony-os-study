import { GoodsList } from "./models"
import {
  SegmentButton,
  SegmentButtonOptions,
  ItemRestriction,
  SegmentButtonTextItem
} from '@ohos.arkui.advanced.SegmentButton'

@Extend(Text)
function showTxt(type: string) {
 .fontWeight((type == "price" || type == "name") ? FontWeight.Bold : FontWeight.Normal)
 .fontColor(type==="price"?Color.Red:type==="name"?Color.Black:Color.Gray)
}

@Entry
@Component
struct ForEachGoodsCase {
  @State goodsList: GoodsList[] = [
    {
      goodsId: "A1B2C3D", // 固定的随机字符
      goodsDesc: "时尚的红色连衣裙，适合各种场合。",
      goodsName: "红色连衣裙",
      goodsUrl: "app.media.goods",
      goodsPrice: 299.99,
    },
    {
      goodsId: "E4F5G6H", // 固定的随机字符
      goodsDesc: "轻便的运动鞋，舒适又时尚。",
      goodsUrl: "app.media.goods",
      goodsPrice: 499.99,
      goodsName: "运动鞋",
    },
    {
      goodsId: "I7J8K9L", // 固定的随机字符
      goodsDesc: "优雅的白色衬衫，适合正式和休闲场合。",
      goodsName: "白色衬衫",
      goodsUrl: "app.media.goods",
      goodsPrice: 199.99,
    },
    {
      goodsId: "M1N2O3P", // 固定的随机字符
      goodsDesc: "高腰牛仔裤，时尚百搭。",
      goodsName: "牛仔裤",
      goodsUrl: "app.media.goods",
      goodsPrice: 259.99,
    },
    {
      goodsId: "Q4R5S6T", // 固定的随机字符
      goodsDesc: "柔软舒适的羊毛大衣，适合冬季穿着。",
      goodsName: "羊毛大衣",
      goodsUrl: "app.media.goods",
      goodsPrice: 799.99,
    },
    {
      goodsId: "U7V8W9X", // 固定的随机字符
      goodsDesc: "经典的黑色皮裙，展现你的时尚品味。",
      goodsName: "黑色皮裙",
      goodsUrl: "app.media.goods",
      goodsPrice: 349.99,
    },
    {
      goodsId: "Y1Z2A3B", // 固定的随机字符
      goodsDesc: "精美的花卉图案连衣裙，适合夏季穿着。",
      goodsName: "花卉连衣裙",
      goodsUrl: "app.media.goods",
      goodsPrice: 299.99,
    },
    {
      goodsId: "C4D5E6F", // 固定的随机字符
      goodsDesc: "舒适的运动裤，适合休闲或健身穿着。",
      goodsName: "运动裤",
      goodsUrl: "app.media.goods",
      goodsPrice: 179.99,
    },
    {
      goodsId: "G7H8I9J", // 固定的随机字符
      goodsDesc: "宽松的针织毛衣，舒适又保暖。",
      goodsName: "针织毛衣",
      goodsUrl: "app.media.goods",
      goodsPrice: 329.99,
    },
    {
      goodsId: "K1L2M3N", // 固定的随机字符
      goodsDesc: "简约的白色T恤，适合日常穿着。",
      goodsName: "白色T恤",
      goodsUrl: "app.media.goods",
      goodsPrice: 99.99,
    }
  ]
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '单列' }, { text: '双列' }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State tabSelectedIndexes: number[] = [0]

  build() {
    Column() {
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: $tabSelectedIndexes
      })
      if (this.tabSelectedIndexes[0] === 0) {
        List({ space: 20 }) {
          ForEach(this.goodsList, (goodsItem: GoodsList, index: number) => {
            ListItem() {
              Row() {
                Image($r(`${goodsItem.goodsUrl}${index}`)).height("100%").borderRadius(5).width(150)
                Column() {
                  Text(goodsItem.goodsName).showTxt("name")
                  Text(goodsItem.goodsDesc).showTxt("desc")
                  Text("￥" + goodsItem.goodsPrice).showTxt("price")
                }
                .alignItems(HorizontalAlign.Start)
                .justifyContent(FlexAlign.SpaceBetween)
                .height("100%")
                .layoutWeight(1)
                .padding(20)
              }.height(200).width("100%")
            }
          })

        }.padding(20)
      } else {
        Grid() {
          ForEach(this.goodsList, (goodsItem: GoodsList, index: number) => {
            GridItem() {
              Column() {
                Image($r(`${goodsItem.goodsUrl}${index}`)).width("100%").borderRadius(5)
                Row() {
                  Column() {
                    Text(goodsItem.goodsName).showTxt("name")
                    Text("￥" + goodsItem.goodsPrice).showTxt("price")
                  }.width(100).height(100).justifyContent(FlexAlign.SpaceBetween).padding({
                    top: 20,
                    bottom: 30
                  })
                  Text(goodsItem.goodsDesc).showTxt("desc").layoutWeight(1)
                }.width("100%").justifyContent(FlexAlign.SpaceBetween).layoutWeight(1)
              }.height(300)
            }
          })
        }.padding(20).columnsTemplate("1fr 1fr").columnsGap(10).rowsGap(10)
      }
    }

  }
}