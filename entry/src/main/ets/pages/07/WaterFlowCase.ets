import { GoodsItem, GoodsItemModel } from "./model/index"
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WaterFlowCase {
  @State goodsList: GoodsItem[] = [
    {
      goodsId: "A1B2C3D", // 固定的随机字符
      goodsDesc: "时尚的红色连衣裙，适合各种场合。",
      goodsName: "红色连衣裙",
      goodsUrl: $r("app.media.goods0"),
      goodsPrice: 299.99,
    },
    {
      goodsId: "E4F5G6H", // 固定的随机字符
      goodsDesc: "轻便的运动鞋，舒适又时尚。",
      goodsUrl: $r("app.media.goods1"),
      goodsPrice: 499.99,
      goodsName: "运动鞋",
    },
    {
      goodsId: "I7J8K9L", // 固定的随机字符
      goodsDesc: "优雅的白色衬衫，适合正式和休闲场合。",
      goodsName: "白色衬衫",
      goodsUrl: $r("app.media.goods2"),
      goodsPrice: 199.99,
    },
    {
      goodsId: "M1N2O3P", // 固定的随机字符
      goodsDesc: "高腰牛仔裤，时尚百搭。",
      goodsName: "牛仔裤",
      goodsUrl: $r("app.media.goods3"),
      goodsPrice: 259.99,
    },
    {
      goodsId: "Q4R5S6T", // 固定的随机字符
      goodsDesc: "柔软舒适的羊毛大衣，适合冬季穿着。",
      goodsName: "羊毛大衣",
      goodsUrl: $r("app.media.goods4"),
      goodsPrice: 799.99,
    },
    {
      goodsId: "U7V8W9X", // 固定的随机字符
      goodsDesc: "经典的黑色皮裙，展现你的时尚品味。",
      goodsName: "黑色皮裙",
      goodsUrl: $r("app.media.goods5"),
      goodsPrice: 349.89,
    },
    {
      goodsId: "Y1Z2A3B", // 固定的随机字符
      goodsDesc: "精美的花卉图案连衣裙，适合夏季穿着。",
      goodsName: "花卉连衣裙",
      goodsUrl: $r("app.media.goods6"),
      goodsPrice: 299.39,
    },
    {
      goodsId: "C4D5E6F", // 固定的随机字符
      goodsDesc: "舒适的运动裤，适合休闲或健身穿着。",
      goodsName: "运动裤",
      goodsUrl: $r("app.media.goods7"),
      goodsPrice: 179.99,
    },
    {
      goodsId: "G7H8I9J", // 固定的随机字符
      goodsDesc: "宽松的针织毛衣，舒适又保暖。",
      goodsName: "针织毛衣",
      goodsUrl: $r("app.media.goods8"),
      goodsPrice: 329.89,
    },
    {
      goodsId: "K1L2M3N", // 固定的随机字符
      goodsDesc: "简约的白色T恤，适合日常穿着。",
      goodsName: "白色T恤",
      goodsUrl: $r("app.media.goods9"),
      goodsPrice: 99.99,
    }

  ]
  @State loadingFlag: boolean = false

  @Builder
  imageBuilder(item: GoodsItem, index: number) {
    Column({ space: 10 }) {
      Image(item.goodsUrl).height(index % 2 ? 220 : 180).borderRadius(4)
      Text(item.goodsDesc).margin({
        top: 20
      }).fontSize(14).lineHeight(22)
    }.justifyContent(FlexAlign.Center)
  }

  @Builder
  flowFooterBuilder() {
    Row({ space: 4 }) {
      Text("数据加载中")
      LoadingProgress().width(24).height(24)
    }.width("100%").height(60).justifyContent(FlexAlign.Center)
  }

  loadMore(): Promise<boolean> {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        try {
          this.goodsList.push(...this.goodsList.slice(0, 9));
          resolve(!this.loadingFlag);
        } catch (error) {
          reject(error);
        }
      }, 1000);
    });
  }

  build() {
    WaterFlow({ footer: this.flowFooterBuilder() }) {
      ForEach(this.goodsList, (item: GoodsItem, index: number) => {
        FlowItem() {
          this.imageBuilder(item, index)
        }
      }, (item: GoodsItem) => item.goodsId)
    }
    .columnsTemplate("1fr 1fr")
    .rowsGap(20)
    .columnsGap(20)
    .padding(20)
    .onReachEnd(async () => {
      if (!this.loadingFlag) {
        this.loadingFlag = true
        try {
          const res: boolean = await this.loadMore()
          this.loadingFlag = res
        } catch (e) {
          promptAction.showToast({message:"网络执行抛错"+JSON.stringify(e)})
        }
      }

    })
  }
}