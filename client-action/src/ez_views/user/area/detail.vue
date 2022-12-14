<template>
  <!-- EZDML_PREVIEW_HTML:ElementVuePreview.html -->
  <div>
    <el-form :model="formData" label-width="80px">
      <el-form-item label="名称" required>
        <el-input v-model="formData['name']" autocomplete="off" clearable>
        </el-input>
      </el-form-item>

      <el-form-item label="全称" required>
        <el-input v-model="formData['fullName']">
          <el-button slot="append" icon="el-icon-more"></el-button>
        </el-input>
      </el-form-item>

      <el-form-item label="创建日期" required>
        <el-date-picker v-model="formData['createDate']" type="date">
        </el-date-picker>
      </el-form-item>

      <el-form-item label="最后修改日期" required>
        <el-date-picker v-model="formData['modifyDate']" type="date">
        </el-date-picker>
      </el-form-item>

      <el-form-item label="排序">
        <el-input-number v-model="formData['orders']" precision="0">
        </el-input-number>
      </el-form-item>

      <el-form-item label="层级" required>
        <el-input-number v-model="formData['grade']" precision="0">
        </el-input-number>
      </el-form-item>

      <el-form-item label="树路径" required>
        <el-input v-model="formData['treePath']" autocomplete="off" clearable>
        </el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="onSubmit">创建</el-button>
        <el-button @click="onCancel">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import request from "@/utils/request";

function getData_Detail(params) {
  return request({
    url: "/ez_user/area/detail",
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
      formData: null,
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
      getData_Detail({ id: 1 }).then((response) => {
        this.formData = response.data.detail;
        this.listLoading = false;
      });
    },
    onSubmit() {},
    onCancel() {
      this.$router.go(-1);
    },
  },
};

export default vueAppInfo;
</script>

<style></style>
