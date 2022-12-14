<template>
  <div class="home">
    <swiper />
    <div class="section" v-for="(item, index) in songsList" :key="index">
      <div class="section-title">{{ item.name }}</div>
      <content-list :contentList="item.list"></content-list>
    </div>
  </div>
</template>

<script>
import Swiper from "../components/Swiper";
import contentList from "../components/ContentList";
import {getAllSongList } from "../api/index";
export default {
  name: "home",
  components: {
    Swiper,
    contentList
  },
  data() {
    return {
      songsList: [
        {
          name: "推荐文章",
          list: [
           /*  {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            },
            {
              pic:
                "https://pic1.zhimg.com/v2-1593823aa77d0080d506824ffb744be2_r.jpg?source=1940ef5c",
              name: "测试数据",
              title: "测试标题",
              content: "测试文章"
            } */
          ]
        }
      ]
    };
  },
  created() {
    this.getSongList();
    this.getSinger();
  },
  methods: {
    getSongList() {
      //获取前十条歌单
      getAllSongList()
        .then(res => {
          console.log(res);
          this.songsList[0].list = res.data.slice(0, 10);
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/home.scss";
</style>
