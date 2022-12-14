<template>
  <div class="content-list">
    <ul class="section-content">
      <li
        class="content-item"
        v-for="(item, index) in contentList"
        :key="index"
      >
        <div class="kuo" @click="goAlbum(item, item.categoryName)">
          <img class="item-img" :src="item.originalUrl" />
          <div class="mask">
            <i>{{ item.articleContent }} </i>
            <svg class="icon"></svg>
          </div>
        </div>
        <p class="item-name">{{ item.categoryName || item.articleTitle }}</p>
      </li>
    </ul>
  </div>
</template>
<script>
import { mixin } from "../mixins";
export default {
  name: "content-list",
  mixins: [mixin],
  props: ["contentList"],
  methods: {
    goAlbum(item, type) {
      this.$store.commit("setTempList", item);
      if (type) {
        //文章详情
        this.$router.push({ path: `song-list-album/${item.id}` });
      }
    }
  }
};
</script>
<style lang="scss" scoped>
@import "../assets/css/content-list.scss";
</style>
