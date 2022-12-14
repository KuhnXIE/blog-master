<template>
  <div>
    <br />
    <el-row>
      作者名称：<el-input size="mini" clearable v-model="queryDto.authorName" placeholder="请输入名称"></el-input>

      类别：<el-select size="mini" clearable v-model="queryDto.categoryId" filterable placeholder="选择分类">
        <el-option v-for="item in categoryOptions" :key="item.id" :label="item.categoryName" :value="item.id" />
      </el-select>
      <el-button type="primary" @click="listPage()">搜索</el-button>
    </el-row>
    <hr />

    <el-table :data="article">

      <el-table-column prop="id" label="编号"></el-table-column>
      <el-table-column prop="nickname" label="作者名称"></el-table-column>
      <el-table-column prop="categoryName" label="类别名称"></el-table-column>
      <el-table-column prop="articleTitle" label="标题"></el-table-column>
      <el-table-column prop="articleContent" label="内容"></el-table-column>
      <el-table-column label="类型">
        <template slot-scope="scope">
          {{ scope.row.type == 1 ? "原创" : "转载" }}
        </template>
      </el-table-column>
      <el-table-column prop="originalUrl" label="原文链接"></el-table-column>
      <el-table-column label="是否置顶">
        <template slot-scope="scope">
          {{ scope.row.isTop == 1 ? "置顶" : "非置顶" }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          {{ scope.row.status == 1 ? "公开" : "私密" }}
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间"></el-table-column>

      <el-table-column fixed="right" label="操作" width="100">
        <template slot-scope="scope">
          <el-button @click="handleDlete(scope.row)" type="text" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="block">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
        :current-page="queryDto.pageCurrent" :page-sizes="[5, 10, 20, 50]" :page-size="queryDto.pageSize"
        layout="total, sizes, prev, pager, next, jumper" :total="total">
      </el-pagination>
    </div>
  </div>
</template>
  
<script>
import { list, listPage, deleteById } from "@/api/article";
import { list as listCategory } from "@/api/category";
export default {
  async mounted() {
    this.listPage();
    const { data } = await listCategory();
    this.categoryOptions = data
  },
  data() {
    return {
      article: [],
      queryDto: {
        pageCurrent: 1,
        pageSize: 5,
        categoryId: null,
        authorName: ''
      },
      total: 0,
      categoryOptions: []
    }
  },
  methods: {
    async handleDlete(row) {
      try {
        await this.$confirm('此操作将永久删除该, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
        await deleteById(row.id)
        this.listPage();
      } catch (error) {
        console.log("取消删除！");
      }
    },
    async all() {
      const { data } = await list();
      this.article = data
    },
    handleCurrentChange(page) {
      this.queryDto.pageCurrent = page
      this.listPage()
    },
    handleSizeChange(size) {
      this.queryDto.pageSize = size
      this.listPage()
    },
    async listPage() {
      const { data } = await listPage(this.queryDto);
      // this.category = page
      this.article = data.records
      this.total = data.total
    }
  }
};
</script>
  
<style scoped>
.el-input--mini,
.el-select--mini {
  width: 193px;
  margin: 10px 10 px 0 0;
}
</style>