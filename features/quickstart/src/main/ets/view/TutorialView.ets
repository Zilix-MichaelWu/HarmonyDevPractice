
import { ArticleClass } from '../model/ArticleClass';
import { bufferToString } from '../util/BufferUtil';

@Preview
@Component
export struct TutorialView{
  @State tutorialList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getTutorialDataFromJSON();
  }

  getTutorialDataFromJSON() { // 通过ResourceManager获取当前工程目录下rawfile中的json文件内容
    getContext(this).resourceManager.getRawFileContent('TutorialData.json').then(value => { // ResourceManager的getRawfileContent方法，从rawfile文件中读取对应的JSON文件

      // 获取buffer内容
      // let buffer: ArrayBufferLike = value.buffer;
      // 转换为字符串
      // let res: string =  bufferToString(buffer);
      // 解析为数据结构
      // this.bannerList = JSON.parse(res) as BannerClass[];
      // 转换为字符串

      // 上面3条是过程，以下是简化写法
      this.tutorialList = JSON.parse(bufferToString(value.buffer)) as ArticleClass[];

      // 解析为数据结构
    })
  }

  build() {
    Column() {
      Text('入门教程')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({ space: 12 }) {
        ForEach(this.tutorialList, (item: ArticleClass) => {
          ListItem() {
            TutorialItem({ tutorialItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}


@Preview
@Component
struct TutorialItem {
  // private title: string = 'Step1 快速入门介绍';
  // private brief: string = '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序 。';
  @Prop tutorialItem: ArticleClass;

  build() {
    Row() {
      Column() {
        // Text(this.title)
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        // Text(this.brief)
        Text(this.tutorialItem.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }
      .height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })

      // Image($r('app.media.enablement_pic1'))
      Image($r(this.tutorialItem.imageSrc))
        .height(64)
        .width(108)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}