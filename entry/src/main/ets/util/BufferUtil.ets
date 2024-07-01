// src/main/ets/util/BufferUtil.ets
// 由于ResourceManager获取到的是ArrayBufferLike类型的内容，所以需要将对应的内容转换为字符串，并将字符串解析为对应的数据结构

import { util } from '@kit.ArkTS';

export function bufferToString(buffer: ArrayBufferLike): string {
  let textDecoder = util.TextDecoder.create('utf-8', {
    ignoreBOM: true
  });
  let resultPut = textDecoder.decodeWithStream(new Uint8Array(buffer), {
    stream: true
  });
  return resultPut;
}