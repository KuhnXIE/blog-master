<template>
  <div class="createPost-container">
    <el-form ref="postForm" :model="postForm" class="form-container">
      <el-button style="margin-left: 10px" @click="save()" type="success">发布</el-button>

      <div>
        <el-form-item label-width="45px" label="标题:">
          <el-input :rows="1" v-model="postForm.title" type="textarea" autosize placeholder="请输入标题" />
        </el-form-item>

        <div>
          <el-row> </el-row>
          <el-row :gutter="20">
            <el-col :span="5">
              <el-form-item label-width="80px" label="文章分类:">
                <el-select v-model="postForm.categoryId" filterable placeholder="选择分类">
                  <el-option v-for="item in categoryOptions" :key="item.id" :label="item.categoryName" :value="item.id" />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="5">
              <el-form-item label-width="80px" label="是否原创:">
                <el-switch v-model="postForm.isOriginal" active-color="#13ce66" inactive-color="#ff4949" />
              </el-form-item>
            </el-col>

            <el-col :span="15">
              <el-form-item v-if="!postForm.isOriginal" label-width="80px" label="引用链接:">
                <el-input v-model="postForm.originalUrl" autosize active-color="#13ce66" inactive-color="#ff4949" />
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="20">
            <el-col :span="5">
              <el-form-item label-width="80px" label="是否置顶:">
                <el-switch v-model="postForm.isTop" active-color="#13ce66" inactive-color="#ff4949" />
              </el-form-item>
            </el-col>

            <el-col :span="5">
              <el-form-item label-width="80px" label="是否公开:">
                <el-switch v-model="postForm.status" autosize active-color="#13ce66" inactive-color="#ff4949" />
              </el-form-item>
            </el-col>
          </el-row>

          <el-col :span="20">
            <el-form-item label-width="65px" label="背景图:">
              <el-input v-model="postForm.originalUrl" autosize />
            </el-form-item>
          </el-col>
        </div>

        <div class="markdown-container">
          <mavon-editor v-model="content" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px" />
        </div>
      </div>
    </el-form>
  </div>
</template>

<script>
import { list } from "@/api/category";
import { mavonEditor } from "mavon-editor";
import { save } from "@/api/article";
import { mapState } from "vuex";
export default {
  components: {
    mavonEditor,
  },
  async mounted() {
    const { data } = await list();
    this.categoryOptions = data;
  },
  computed: mapState(["userId"]),
  data() {
    return {
      postForm: {
        title: "",
        isOriginal: true,
        categoryId: "",
        originalUrl: "",
        isTop: false,
        status: true,
      },
      categoryOptions: [],
      value: "mavon-editor",
      content: "",
      configs: {},
    };
  },
  methods: {
    async save() {
      console.log(this.$store.state.user.userId);
      var article = {
        userId: sessionStorage.getItem("userId"),
        articleTitle: this.postForm.title,
        type: this.postForm.isOriginal ? 1 : 2,
        categoryId: this.postForm.categoryId,
        originalUrl: this.postForm.originalUrl,
        articleContent: this.content,
        isTop: this.postForm.isTop ? 1 : 0,
        status: this.postForm.status ? 1 : 2,
      };

      console.log(article);
      try {
        const res = await save(article);
        if (res.code == 20000) {
          this.$message({
            message:res.msg,
            type:"success"
          })
          this.postForm = {}
        }else{
          this.$message.error(res.msg)
        }

      } catch (error) {
        console.log(error);
        this.$message.error("服务器出错了")
      }
    },
    $imgAdd(pos, $file) {
      var formdata = new FormData();
      formdata.append("file", $file);
      //将下面上传接口替换为你自己的服务器接口
      axios({
        url: "/common/upload",
        method: "post",
        data: formdata,
        headers: { "Content-Type": "multipart/form-data" },
      }).then((url) => {
        this.$refs.md.$img2Url(pos, url);
      });
    },
    change(value, render) {
      // render 为 markdown 解析后的结果
      this.html = render;
    },
  },
};
</script>

<style scoped lang="scss">
.markdown-container {
  .editor-btn {
    margin-top: 20px;
  }

  .title {
    padding-bottom: 30px;
    text-align: center;
    font-size: 20px;
    letter-spacing: 1px;
    color: #333;
    font-weight: 600;
  }
}
</style>
