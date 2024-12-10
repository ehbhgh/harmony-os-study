import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct PhotoAlbum {
  @State albumStatus: boolean = false
  @State maxSelectNum: number = 9
  @State albumList: albumInterface[] = [
    {
      imgUrl: $r("app.media.photo1"),
      imgId: 1
    },
    {
      imgUrl: $r("app.media.photo2"),
      imgId: 2
    }, {
    imgUrl: $r("app.media.photo3"),
    imgId: 3
  }, {
    imgUrl: $r("app.media.photo4"),
    imgId: 4
  }, {
    imgUrl: $r("app.media.photo5"),
    imgId: 5
  }, {
    imgUrl: $r("app.media.photo6"),
    imgId: 6
  }, {
    imgUrl: $r("app.media.photo7"),
    imgId: 7
  }, {
    imgUrl: $r("app.media.photo8"),
    imgId: 8
  }, {
    imgUrl: $r("app.media.photo9"),
    imgId: 9
  }, {
    imgUrl: $r("app.media.photo10"),
    imgId: 10
  }, {
    imgUrl: $r("app.media.photo11"),
    imgId: 11
  }, {
    imgUrl: $r("app.media.photo12"),
    imgId: 12
  }
    , {
    imgUrl: $r("app.media.photo13"),
    imgId: 13
  }
    , {
    imgUrl: $r("app.media.photo14"),
    imgId: 14
  }
  ]
  @State selectPhotos: albumInterface[] = []
  @State targetImgUrl: ResourceStr = ""
  //显示生命一个类型
  preview: CustomDialogController = new CustomDialogController({
    builder: PreviewDialog({ imgUrl: this.targetImgUrl }),
    customStyle: true,
  })

  //完成后追加图片
  changeAlbumList(item: albumInterface[]) {
    this.selectPhotos = [...this.selectPhotos, ...item]
    this.closeDialog()
  }

  //关闭
  closeDialog() {
    this.albumStatus = false
  }

  //点开阅览图片
  previewPhoto(photo: albumInterface) {
    this.targetImgUrl = photo.imgUrl
    this.preview.open()
  }

  build() {
    Stack() {
      Column() {
        Button("点击打开相册").onClick(() => {
          this.albumStatus = true
        })
        Grid() {
          ForEach(this.selectPhotos, (photo: albumInterface) => {
            GridItem() {
              Image(photo.imgUrl).aspectRatio(1).borderRadius(6).onClick(() => {
                this.previewPhoto(photo)
              })
            }
          })
        }.columnsTemplate("1fr 1fr").columnsGap(10).rowsGap(10).padding(10)
      }.width("100%")

      if (this.albumStatus) {
        PhotoItem({
          close: () => {
            this.closeDialog()
          },
          albumList: this.albumList,
          maxSelectNum: this.maxSelectNum,
          finishAlbum: (selectAlbumList) => {
            this.changeAlbumList(selectAlbumList)
          }
        })
      }

    }

  }
}

@Component
struct PhotoItem {
  @State
  selectAlbumList: albumInterface[] = []
  @Prop
  albumList: albumInterface[] = []
  @Prop
  maxSelectNum: number = 9
  close: () => void = () => {
  }
  finishAlbum: (selectPhotos: albumInterface[]) => void = () => {
  }

  //选择照片
  selectPhotos(photo: albumInterface) {
    //根据当前选择的照片是否在定义的选择照片的数组中判断是否应该把当前照片放入数组中
    //并且选择的最大
    const index = this.selectAlbumList.findIndex(item => item.imgId === photo.imgId)
    if (index === -1) {
      if (this.selectAlbumList.length >= this.maxSelectNum) {
        promptAction.showToast({ message: `选择的照片不能超过${this.maxSelectNum}张` })
        return
      }
      this.selectAlbumList.push(photo)
    } else {
      this.selectAlbumList.splice(index, 1)
    }

  }

  //获取是否显示对号
  isSelectPhoto(photo: albumInterface) {
    return this.selectAlbumList.find(item => item.imgId === photo.imgId)
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.albumList, (item: albumInterface) => {
          GridItem() {
            Stack({ alignContent: Alignment.TopEnd }) {
              Image(item.imgUrl).aspectRatio(1)
              if (this.isSelectPhoto(item)) {
                Row() {
                  Image($r("app.media.selectAlbumPhoto"))
                    .fillColor("#95EC69")
                    .width(20)
                    .height(20)
                    .fillColor("#fff")
                }
                .width(30)
                .height(30)
                .borderRadius("50%")
                .backgroundColor("#95EC69")
                .alignItems(VerticalAlign.Center)
                .justifyContent(FlexAlign.Center)
                .margin({
                  right: 5,
                  top: 5
                })
              } else {
                Row() {
                }
                .width(30)
                .height(30)
                .borderRadius("50%")
                .border({
                  width: 2,
                  color: "#fff"
                })
                .margin({
                  right: 5,
                  top: 5
                })
              }

            }.onClick(() => {
              this.selectPhotos(item)
            })
          }
        })
      }
      .layoutWeight(1)
      .columnsTemplate("1fr 1fr 1fr")
      .columnsGap(2)
      .rowsGap(2)
      .padding(2)

      Row() {
        Button("取消").backgroundColor(Color.Gray).onClick(() => {
          this.close()
        })
        Text(`已选${this.selectAlbumList.length}张,可选${this.maxSelectNum}张`)
        Button("完成").onClick(() => {
          if (this.selectAlbumList.length > 0) {
            this.finishAlbum(this.selectAlbumList)
          }
        })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left: 10,
        right: 10
      })
      .width("100%")
      .height(60)

    }.width("100%").height("100%").backgroundColor("#fff")
  }
}

interface albumInterface {
  imgUrl: ResourceStr
  imgId: number
}

@CustomDialog
@Component
struct PreviewDialog {
  controller?: CustomDialogController
  imgUrl: ResourceStr = ""

  build() {
    Column() {
      Image(this.imgUrl).width("100%") .onClick(() => {
        if (this.controller !== undefined) {
          this.controller.close()
        }
      })
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}