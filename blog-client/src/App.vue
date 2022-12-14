<template>
  <div id="app">
    <the-header />
    <router-view class="music-content" />
    <song-audio />
    <the-aside />
    <!-- <play-bar/> -->
    <scroll-top />
    <the-footer />
  </div>
</template>

<script>
import TheHeader from './components/TheHeader';
import ScrollTop from './components/ScrollTop';
import TheFooter from './components/TheFooter';
import SongAudio from './components/SongAudio';
import TheAside from './components/TheAside';
import PlayBar from './components/PlayBar';

export default {
  name: 'App',
  components: {
    TheHeader,
    ScrollTop,
    TheFooter,
    SongAudio,
    TheAside,
    PlayBar
  },
   /*看板娘初始化
      参数说明
      model 模型的配置
         json 文件资源路径，可以支持网络路径，此处使用的是相对路径
         scale 模型缩放系数
      display 模型布局
         position 位置
         width 宽度
         height 高度
         hOffset 水平偏移量
         vOffset 垂直偏移量
      mobile 移动端配置
         show 显示/隐藏
         scale 缩放比例
      react 模型矩形框样式
         opacity 透明度
         opacityDefault 默认透明度
         opacityOnHover 鼠标悬浮透明度
    */
  created() {
    setTimeout(() => {
      window.L2Dwidget.init({
        pluginRootPath: '../static/live2dw/',
        pluginJsPath: 'lib/',
        pluginModelPath: 'live2d-widget-model-haru_2/assets/', //中间这个haru_2就是你的老婆,想换个老婆,换这个就可以了
        tagMode: false,
        debug: false,
        model: { jsonPath: '../static/live2dw/live2d-widget-model-haru_2/assets/haru02.model.json' },
        display: { position: 'right', width: 268, height: 600 },  //调整大小,和位置
        mobile: { show: true },   //要不要盯着你的鼠标看
        log: false,
      })
    }, 1000)
  }
}
</script>

<style  lang="scss" scoped>
@import "./assets/css/app.scss";
</style>
