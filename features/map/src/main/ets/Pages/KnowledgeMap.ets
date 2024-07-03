@Preview
@Component
export struct KnowledgeMap {

  build() {
    Column() {
      Text('知识地图')
        .fontSize(24)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Start)
        .lineHeight(33)
        .fontWeight(700)
        .width('100%')
      Image($r('app.media.knowledge_map_banner'))
        .width('100%')
        .borderRadius(16)
        .margin({ top: 19, bottom: 8 })
      Text('通过循序渐进的学习路径，无经验和有经验的开发者都可以轻松掌握ArkTS语言声明式开发范式，体验更简洁、更友好的HarmonyOS应用开发旅程。')
        .fontFamily('HarmonyHeiTi')
        .fontSize(14)
        .fontColor('rgba(0,0,0,0.60)')
        .fontWeight(400)
        .textAlign(TextAlign.Start)
    }
    .padding({ top: 12, right: 16, bottom: 12, left: 16})
    .backgroundColor('#F1F3F5')
  }
}