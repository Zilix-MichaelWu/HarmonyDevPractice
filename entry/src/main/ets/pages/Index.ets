/*
  * 2024-06-24
  * Kevin - 武楷博
  * Index.ets
 */

class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url : string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}



@Entry // 这个装饰器标识该组件是应用的入口组件。
@Component // 这个装饰器标识Index是一个组件。

struct Index {

  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight('700')
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)

      Banner()
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}



@Preview
@Component

struct Banner {
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.banner_pic0'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.banner_pic1'),
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.banner_pic2'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', $r('app.media.banner_pic3'),
      'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', $r('app.media.banner_pic4'),
      'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', $r('app.media.banner_pic5'),
      'https://developer.huawei.com/consumer/cn/sdk')
  ];

  build() {
    Image($r('app.media.banner_pic1'))
      .objectFit(ImageFit.Contain)
      .width('100%')
      .padding({ top: 11, left: 16, right: 16 })
      .borderRadius(16)
  }
}