<template>
  <div class="app-container">
    <el-form ref="form" :model="form" label-width="120px">
      <el-form-item label="活动名称">
        <el-input v-model="form.name" />
      </el-form-item>
      <el-form-item label="所在城市">
        <el-select v-model="form.region" placeholder="请选择你所在的城市">
          <el-option label="上海" value="shanghai" />
          <el-option label="北京" value="beijing" />
        </el-select>
      </el-form-item>
      <el-form-item label="开始时间">
        <el-col :span="11">
          <el-date-picker v-model="form.date1" type="date" placeholder="请选择日期" style="width: 100%;" />
        </el-col>
        <el-col :span="2" class="line">-</el-col>
        <el-col :span="11">
          <el-time-picker v-model="form.date2" type="fixed-time" placeholder="选择时间" style="width: 100%;" />
        </el-col>
      </el-form-item>
      <el-form-item label="立即发送">
        <el-switch v-model="form.delivery" />
      </el-form-item>
      <el-form-item label="活动类型">
        <el-checkbox-group v-model="form.type">
          <el-checkbox label="在线活动" name="type" />
          <el-checkbox label="促销活动" name="type" />
          <el-checkbox label="线下活动" name="type" />
          <el-checkbox label="品德展示" name="type" />
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="资源">
        <el-radio-group v-model="form.resource">
          <el-radio label="资金赞助" />
          <el-radio label="场地提供" />
        </el-radio-group>
      </el-form-item>
      <el-form-item label="内容">
        <el-input v-model="form.desc" type="textarea" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">创建</el-button>
        <el-button @click="onCancel">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      }
    }
  },
  methods: {
    onSubmit() {
      this.$message('submit!')
    },
    onCancel() {
      this.$message({
        message: 'cancel!',
        type: 'warning'
      })
      this.$router.go(-1)
    }
  }
}
</script>

<style scoped>
.line{
  text-align: center;
}
</style>

