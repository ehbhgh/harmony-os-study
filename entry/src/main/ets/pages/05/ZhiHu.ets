import { WsNavBar, WsCommentItem, WsBarTitle, WsInput } from "./components"
import { ReplyItem, ReplyItemModel } from "./models"

@Entry
@Component
struct ZhiHu {
  @State replyList: Array<ReplyItem> = [
    {
      id: 1,
      avatar: $r("app.media.pic1"),
      author: "Alice",
      content: "芦花白了，晚风吹过时，秋的气息扑面而来，岸边的小村落安静得如诗",
      time: "2024-12-01 10:00",
      area: "北京",
      likeNum: 25,
      likeFlag: true,
    },
    {
      id: 2,
      avatar: $r("app.media.pic2"),
      author: "秦颖",
      content: "江岸的枫叶红得醉人，水天一色中，似乎还能听见远处渔歌的余音",
      time: "2024-12-02 12:30",
      area: "上海",
      likeNum: 15,
      likeFlag: false,
    },
    {
      id: 3,
      avatar: $r("app.media.pic3"),
      author: "陈梦",
      content: "秋阳洒下金辉，水波粼粼，江边的乌桕树在风中微微颤动，像是低语",
      time: "2024-12-03 14:45",
      area: "广州",
      likeNum: 40,
      likeFlag: true,
    },
    {
      id: 4,
      avatar: $r("app.media.pic4"),
      author: "吴雨",
      content: "山间的炊烟慢慢升起，与青天融为一体，苍江依旧环绕着这片安宁的村庄",
      time: "2024-12-04 09:20",
      area: "深圳",
      likeNum: 12,
      likeFlag: true,
    },
    {
      id: 5,
      avatar: $r("app.media.pic5"),
      author: "王蒙",
      content: "晨雾轻柔地弥漫在江面上，远山的轮廓若隐若现，如诗般动人",
      time: "2024-12-04 11:15",
      area: "杭州",
      likeNum: 50,
      likeFlag: true,
    },
    {
      id: 6,
      avatar: $r("app.media.pic6"),
      author: "姚广义",
      content: "江水绕过小洲，洲上的芦苇在晚风中摇曳，夕阳下的渔船慢慢驶过，满载收获",
      time: "2024-12-05 08:10",
      area: "成都",
      likeNum: 8,
      likeFlag: false,
    },
    {
      id: 7,
      avatar: $r("app.media.pic7"),
      author: "孙成功",
      content: "江边的老树静静伫立，繁茂的枝叶中偶有鸟鸣回荡，增添了几分生趣",
      time: "2024-12-05 13:30",
      area: "南京",
      likeNum: 18,
      likeFlag: true,
    },
    {
      id: 8,
      avatar: $r("app.media.pic8"),
      author: "李白水",
      content: "秋天的江面，一片清澈透明，白鹭翩翩飞舞，点缀着这无边的宁静",
      time: "2024-12-05 15:00",
      area: "武汉",
      likeNum: 22,
      likeFlag: true,
    },
    {
      id: 9,
      avatar: $r("app.media.pic9"),
      author: "王倩倩",
      content: "远山连绵起伏，村舍掩映其中，江水缓缓流淌，诉说着秋天的故事",
      time: "2024-12-05 16:20",
      area: "西安",
      likeNum: 35,
      likeFlag: false,
    },
    {
      id: 10,
      avatar: $r("app.media.pic10"),
      author: "周传芳",
      content: "夕阳把江面染成了金色，几只归舟缓缓划过，隐入两岸的秋影之中",
      time: "2024-12-05 17:40",
      area: "重庆",
      likeNum: 10,
      likeFlag: true,
    },
    {
      id: 11,
      avatar: $r("app.media.pic11"),
      author: "莫文浩",
      content: "一条小溪汇入江中，两岸的枫叶灿若云霞，为这秋景增添了热烈的色彩",
      time: "2024-12-05 18:10",
      area: "合肥",
      likeNum: 6,
      likeFlag: false,
    },
    {
      id: 12,
      avatar: $r("app.media.pic12"),
      author: "苏千羽",
      content: "水雾氤氲，江边的小桥若隐若现，岸边的小船轻轻晃动，像是秋日的微梦",
      time: "2024-12-05 19:00",
      area: "天津",
      likeNum: 11,
      likeFlag: true,
    },
    {
      id: 13,
      avatar: $r("app.media.pic13"),
      author: "杨巍",
      content: "渔火点点，远山黛色，江水与夜色交织出一片深邃，静谧得如画卷般醉人",
      time: "2024-12-05 19:30",
      area: "青岛",
      likeNum: 24,
      likeFlag: true,
    },
    {
      id: 14,
      avatar: $r("app.media.pic14"),
      author: "张军凯",
      content: "岸边的草木在秋风中低语，江水清澈见底，仿佛映射着青山的每一个轮廓",
      time: "2024-12-05 20:00",
      area: "大连",
      likeNum: 17,
      likeFlag: false,
    },
    {
      id: 15,
      avatar: $r("app.media.pic15"),
      author: "于远洋",
      content: "晨光洒在江面上，水波细细流淌，岸边的乌桕树满是红叶，映得江水如画",
      time: "2024-12-05 20:30",
      area: "济南",
      likeNum: 30,
      likeFlag: true,
    },
    {
      id: 16,
      avatar: $r("app.media.pic16"),
      author: "孙涛",
      content: "一江秋风，带着几分凉意，渔舟唱晚，柔和的光影洒满了整个江岸",
      time: "2024-12-05 21:00",
      area: "哈尔滨",
      likeNum: 9,
      likeFlag: false,
    },

  ];
  authorComment: ReplyItem = {
    id: 0,
    avatar: $r("app.media.pic19"),
    author: "王苏",
    content: "一江秋水，依旧是澄蓝澈底。两岸的秋山，依旧在袅娜迎人。苍江几曲，就有九簇苇丛，几弯村落，在那里点缀。你坐在轮船舱里，只须抬一抬头，劈面就有江岸乌桕树的红叶和去天不远的青山向你招呼",
    time: "2024-12-01 10:00",
    area: "南京",
    likeNum: 90,
    likeFlag: true,
  }

  //点赞操作
  changeThumbsUp(id: number) {
    this.replyList = this.replyList.map((item: ReplyItem) => {
      const newReplyItem = new ReplyItemModel(item)
      if (newReplyItem.id === id) {
        newReplyItem.likeFlag ? newReplyItem.likeNum-- : newReplyItem.likeNum++
        newReplyItem.likeFlag = !newReplyItem.likeFlag
      }
      return newReplyItem
    })
  }

  build() {
    Column() {
      WsNavBar({ title: "评论回复" })
      WsCommentItem({
        item: new ReplyItemModel(this.authorComment)
      })
      Divider().strokeWidth(2)
      WsBarTitle({ commentNum: this.replyList.length })
      List() {
        ForEach(this.replyList, (item: ReplyItem) => {
          ListItem() {
            WsCommentItem({
              item, changeThumbsUp: () => {
                this.changeThumbsUp(item.id)
              }
            })
          }
        }, (item: ReplyItem) => item.id.toString() + "_" + item.likeNum.toString())
      }.layoutWeight(1)

      WsInput()
    }.height("100%")
  }
}