<template>
  <div class="song-list-album">
    <div class="songs-body">
      <album-content :item="songLists" id="content">
        <template slot="title">{{ songLists.articleTitle }}</template>
      </album-content>
      <div class="comment-list">
        评论区
      </div>
      <div style="clear:both;"></div>
      <comment :playId="songListId" :type="1"></comment>
    </div>
  </div>
</template>
<script>
import { mixin } from "../mixins";
import { songOfSongId } from "../api/index";
import AlbumContent from "../components/AlbumContent";
import Comment from "../components/Comment";
import showdown from "showdown";

export default {
  name: "song-list-album",
  mixins: [mixin],
  components: {
    AlbumContent,
    Comment
  },
  data() {
    return {
      songListId: 0,
      songLists: null //当前页面需要展示的歌曲列表
    };
  },
  created() {
    this.songListId = this.$route.params.id;
    this.getSongList(this.songListId);
  },
  methods: {
    //根据歌曲id获取歌曲信息
    getSongList(id) {
      songOfSongId(id)
        .then(res => {
          console.log(res);
          let converter = new showdown.Converter();
          let htmlText = converter.makeHtml(res.data.articleContent);
          res.data.articleContent = htmlText;
          this.songLists = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/song-list-album.scss";
</style>
