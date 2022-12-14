<template>
  <div>
    <loginLogo />
    <div class="signUp">
      <div class="signUp-head">
        <span>用户注册</span>
      </div>
      <el-form
        :model="registerForm"
        ref="registerForm"
        label-width="70px"
        class="demo-ruleForm"
        :rules="rules"
      >
        <el-form-item prop="username" label="用户昵称">
          <el-input
            v-model="registerForm.nickname"
            placeholder="用户昵称"
          ></el-input>
        </el-form-item>
        <el-form-item prop="username" label="账号">
          <el-input
            v-model="registerForm.username"
            placeholder="账号"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input
            type="password"
            v-model="registerForm.password"
            placeholder="密码"
          ></el-input>
        </el-form-item>
        <el-form-item prop="sex" label="性别">
          <el-radio-group v-model="registerForm.sex">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <div class="login-btn">
          <el-button @click="goback(-1)">取消</el-button>
          <el-button type="primary" @click="SignUp">确定</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>
<script>
import loginLogo from "../components/LoginLogo";
import { rules, cities } from "../assets/data/form";
import { mixin } from "../mixins";
import { SignUp } from "../api/index";

export default {
  name: "sing-up",
  mixins: [mixin],
  components: {
    loginLogo
  },
  data() {
    return {
      registerForm: {
        nickname:"",//用户昵称
        username: "", //用户名
        password: "", //密码
        sex: "", //性别
        email: "", //邮箱
      },
      cities: [], //所有的地区--省
      rules: {} //表单提交的规则
    };
  },
  created() {
    this.rules = rules;
    this.cities = cities;
  },
  methods: {
    SignUp() {
      let _this = this;
      let params = new URLSearchParams();
      params.append("nickname", this.registerForm.nickname);
      params.append("username", this.registerForm.username);
      params.append("password", this.registerForm.password);
      params.append("sex", this.registerForm.sex);
      params.append("email", this.registerForm.email);
      SignUp(params)
        .then(res => {
          if (res.code == 20000) {
            _this.notify("注册成功", "success");
            setTimeout(function() {
              _this.$router.push({ path: "/" });
            }, 2000);
          } else {
            _this.notify("注册失败", "error");
          }
        })
        .catch(err => {
          _this.notify("注册失败", "error");
        });
    },
    goback(index) {
      this.$router.go(index);
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/sign-up.scss";
</style>
