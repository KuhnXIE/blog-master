<template>
  <div class="search">
    <nav class="searchList-nav" ref="change">
      <span
        :class="{ isActive: toggle == 'Songs' }"
        @click="handleChangeView('Songs')"
        >文章</span
      >
      <span
        :class="{ isActive: toggle == 'SongLists' }"
        @click="handleChangeView('SongLists')"
        >作者</span
      >
    </nav>
    <!-- <component :is="currentView"></component> -->
    <div>
      <content-list :contentList="albumDatas"></content-list>
      <div class="pagination">
        <el-pagination
          @current-change="handleCurrentChange"
          background
          layout="total,prev,pager,next"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="albumDatas.length"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<script>
import searchSongs from "../components/search/SearchSongs";
import searchSongLists from "../components/search/SearchSongLists";
import ContentList from "../components/ContentList";
import { searchArticleList } from "../api/index";

export default {


    
  name: "search",
  components: {
    searchSongs,
    searchSongLists,
    ContentList
  },
  created() {
    this.keywords = this.$route.query.keywords;
    this.getArticleList(this.keywords);
  },
  data() {
    return {
      toggle: "Songs",
      currentView: "searchSongs",
      albumDatas: [],
      keywords: "",
      pageSize: 10, //页面大小，一页有15条数据
      currentPage: 1 //当前页，默认第一页
    };
  },
  methods: {
    //切换组件
    handleChangeView(component) {
      this.currentView = "search" + component;
      this.toggle = component;
      this.getArticleList();
    },
    async getArticleList(key) {
      const res = await searchArticleList(this.keywords);
      console.log(res);
      this.albumDatas = res.data;
    },
    handleCurrentChange(val) {
      this.currentPage = val;
    }
  }
};
</script>
<style lang="scss" scoped>
@import "../assets/css/search.scss";
</style>
