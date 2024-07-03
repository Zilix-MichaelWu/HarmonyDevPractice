/*
  * 2024-06-24
  * Kevin - 武楷博
* Index.ets -> QuickStartPage.ets
 */

// import {BannerClass} from '../model/BannerClass'; // 通过外部类ets文件，导入到本ets中引用
// import {ArticleClass} from '../model/ArticleClass'; // 同上

import { TutorialView } from '../view/TutorialView';
import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';

// @Entry // 这个装饰器标识该组件是应用的入口组件。
@Component // 这个装饰器标识Index是一个组件。
export struct QuickStartPage {
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

      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}