<template>
  <div>
    <!-- EZDML_PREVIEW_HTML:ElementVuePreview.html -->
    <el-row>
      <el-button type="primary" @click="handleOper(null, null, 'new')"
        >新增</el-button
      >
      <el-button type="danger" @click="handleOper(null, null, 'batch_delete')"
        >批量删除</el-button
      >
    </el-row>

    <el-table
      v-loading="listLoading"
      :data="itemList"
      border
      stripe
      style="width: 100%"
      @row-click="handleRowClick"
    >
      <el-table-column type="selection" width="40"> </el-table-column>

      <el-table-column prop="name" label="名称" min-width="120">
      </el-table-column>

      <el-table-column prop="fullName" label="全称" min-width="120">
      </el-table-column>

      <el-table-column prop="createDate" label="创建日期" min-width="120">
      </el-table-column>

      <el-table-column prop="modifyDate" label="最后修改日期" min-width="120">
      </el-table-column>

      <el-table-column prop="orders" label="排序" min-width="120">
      </el-table-column>

      <el-table-column prop="grade" label="层级" min-width="120">
      </el-table-column>

      <el-table-column prop="treePath" label="树路径" min-width="120">
      </el-table-column>

      <el-table-column label="操作" min-width="160">
        <template slot-scope="scope">
          <el-button @click="handleOper(scope.column, scope.row, 'view')"
            >查看</el-button
          >
          <el-button
            type="primary"
            @click="handleOper(scope.column, scope.row, 'edit')"
            >编辑</el-button
          >
          <el-button
            type="danger"
            @click="handleOper(scope.column, scope.row, 'delete')"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import request from "@/utils/request";

function getList(params) {
  return request({
    url: "/ez_user/area/list",
    method: "get",
    params,
  });
}

var vueAppInfo = {
  components: {},
  props: [],
  data() {
    return {
      formTitle: "地区",
      colFilterMaps: null,
      itemList: null,
      totalRow: null,
      listLoading: true,
    };
  },
  computed: {},
  watch: {},
  created() {
    this.fetchData();
  },
  mounted() {},
  methods: {
    fetchData() {
      this.listLoading = true;
      getList().then((response) => {
        this.itemList = response.data.items;
        this.colFilterMaps = response.data.filterMap;
        this.totalMap = response.data.totalRow;
        this.listLoading = false;
      });
    },
    filterHandler(value, row, column) {
      const property = column["property"];
      return row[property] === value;
    },

    handleRowClick(row, column) {
      if (!column) return;
      if (column.label == "操作") return;
      this.handleOper(column, row, "view");
    },
    handleOper(column, row, act) {
      if (act == "view") {
        this.$router.push("/ez_user/area_detail/1");
        return;
      }
      this.$message({
        type: "info",
        message: "点击了按钮" + act,
      });
    },
  },
};

export default vueAppInfo;
</script>

<style></style>
