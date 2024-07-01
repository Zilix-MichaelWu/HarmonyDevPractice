
import { ArticleClass } from '../model/ArticleClass';
import { bufferToString } from '../util/BufferUtil';

@Preview
@Component
export struct EnablementView{
  @State enablementList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getTutorialDataFromJSON();
  }

  getTutorialDataFromJSON() { // 通过ResourceManager获取当前工程目录下rawfile中的json文件内容
    getContext(this).resourceManager.getRawFileContent('EnablementData.json').then(value => { // ResourceManager的getRawfileContent方法，从rawfile文件中读取对应的JSON文件

      // 获取buffer内容
      // let buffer: ArrayBufferLike = value.buffer;
      // 转换为字符串
      // let res: string =  bufferToString(buffer);
      // 解析为数据结构
      // this.bannerList = JSON.parse(res) as BannerClass[];
      // 转换为字符串

      // 上面3条是过程，以下是简化写法
      this.enablementList = JSON.parse(bufferToString(value.buffer)) as ArticleClass[];

      // 解析为数据结构
    })
  }

  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid() {
        ForEach(this.enablementList, (item: ArticleClass) => {
          GridItem() {
            EnablementItem({ enablementItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}


@Preview
@Component

struct EnablementItem {
  // private title: string = 'HarmonyOS第一课';
  // private brief: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。';

  @Prop enablementItem: ArticleClass;

  build() {
    Column() {
      // Image($r('app.media.enablement_pic1'))
      Image($r(this.enablementItem.imageSrc))
        .width('100%')
        .objectFit(ImageFit.Cover).height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })
      // Text(this.title)
      Text(this.enablementItem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      // Text(this.brief)
      Text(this.enablementItem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}