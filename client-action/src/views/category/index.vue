<template>
  <div>
    <br />
    <el-row>
      <el-button type="primary" @click="handleOper('save')">新增</el-button>
      <el-button type="danger" @click="handleOper('batch_delete')">批量删除</el-button>
      
      <span >  名称：<el-input clearable size="mini" v-model="queryDto.searchName" placeholder="请输入名称"></el-input></span>

      <el-button type="primary" @click="listPage()">搜索</el-button>
    </el-row>
    <hr />
    <el-table :data="category">
      <el-table-column type="selection" width="40" />
      <el-table-column prop="id" label="编号"></el-table-column>
      <el-table-column prop="categoryName" label="名称"></el-table-column>
      <el-table-column prop="createTime" label="创建时间"></el-table-column>
      <el-table-column fixed="right" label="操作" width="100">
        <template slot-scope="scope">
          <el-button @click="updateById(scope.row)" type="text" size="small">修改</el-button>
          <el-button @click="handleDlete(scope.row)" type="text" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="block">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="queryDto.page"
        :page-sizes="[5, 10, 20, 50]" :page-size="queryDto.size" layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>

    <el-dialog width="22%" title="文章类别" :visible.sync="updateDialogVisible">
      <el-form>
        <el-form-item label="编号">
          <el-input size="mini" :readonly="true" v-model="updateForm.id"></el-input>
        </el-form-item>
        <el-form-item label="名称">
          <el-input size="mini" :readonly="false" v-model="updateForm.categoryName"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" size="mini" @click="updateDialogVisible = false">取 消</el-button>
          <el-button type="primary" size="mini" @click="confirmUpdate(updateForm)">确 定</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <el-dialog width="22%" title="文章类别新增" :visible.sync="createDialogVisible">
      <el-form>
        <el-form-item label="名称">
          <el-input size="mini" :readonly="false" v-model="createForm.categoryName"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" size="mini" @click="createDialogVisible = false">取 消</el-button>
          <el-button type="primary" size="mini" @click="confirmCreate(createForm)">确 定</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

  </div>
</template>

<script>
import { list, save, updateById, deleteById, listPage } from "@/api/category";
export default {
  async mounted() {
    this.listPage();
  },
  data() {
    return {
      category: [],
      updateDialogVisible: false,
      updateForm: {
        id: 0,
        categoryName: ''
      },
      createDialogVisible: false,
      createForm: {
        categoryName: ''
      },
      queryDto: {
        page: 1,
        size: 5,
        searchName:''
      },
      total: 0
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
        this.all();
      } catch (error) {
        console.log("取消删除！");
      }
    },
    async handleOper(str) {
      if (str === 'save') {
        this.createDialogVisible = true
      } else if (str === 'batch_delete') {
        try {
          await this.$confirm('此操作将永久删除该, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          })

          for (const obj of category) {
            console.log(obj);
          }

          // await deleteBatchByIds(row.id)
          // this.all();
        } catch (error) {
          console.log("取消删除！");
        }
      }
    },
    handleCurrentChange(page) {
      console.log(page)
      this.queryDto.page = page
      this.listPage()
    },
    handleSizeChange(size) {
      console.log(size)
      this.queryDto.size = size
      this.listPage()
    },
    updateById(row) {
      this.updateDialogVisible = true
      // this.updateForm = row
      this.updateForm = { ...row }
    },
    async confirmUpdate(row) {
      await updateById(row)
      this.updateDialogVisible = false
      this.all()
    },
    async confirmCreate(row) {
      await save(row)
      this.createDialogVisible = false
      this.all()
    },
    async all() {
      const { data } = await list();
      this.category = data
    },
    async listPage() {
      const { data } = await listPage(this.queryDto.page, this.queryDto.size, this.queryDto.searchName);
      console.log(data);
      // this.category = page
      this.category = data.records
      this.total = data.total
    }
  }
};
</script>

<style scoped>
.el-input--mini{
  width: 193px;
  margin: 10px 10 px 0 0;
}
</style>
