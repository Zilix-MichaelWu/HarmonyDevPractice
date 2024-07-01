
import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../util/BufferUtil';

@Preview // 这个装饰器标识该组件是“单独预览组件”。只能有1个Entry，可以有n个Preview
@Component

export struct Banner {
  @State bannerList: Array<BannerClass> = [];

  aboutToAppear(): void {
    this.getBannerDataFromJSON();
  }

  getBannerDataFromJSON() { // 通过ResourceManager获取当前工程目录下rawfile中的json文件内容
    getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => { // ResourceManager的getRawfileContent方法，从rawfile文件中读取对应的JSON文件

      // 获取buffer内容
      // let buffer: ArrayBufferLike = value.buffer;
      // 转换为字符串
      // let res: string =  bufferToString(buffer);
      // 解析为数据结构
      // this.bannerList = JSON.parse(res) as BannerClass[];
      // 转换为字符串

      // 上面3条是过程，以下是简化写法
      this.bannerList = JSON.parse(bufferToString(value.buffer)) as BannerClass[];

      // 解析为数据结构
    })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass, index: number) => item.id)

      /*
      Image($r('app.media.banner_pic1'))
        .objectFit(ImageFit.Contain)
        .width('100%')
        .padding({ top: 11, left: 16, right: 16 })
        .borderRadius(16)

      Image($r('app.media.banner_pic2'))
        .objectFit(ImageFit.Contain)
        .width('100%')
        .padding({ top: 11, left: 16, right: 16 })
        .borderRadius(16)
        */
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}