<template>
  <div
    style="position:relative;"
    v-bind:style="{ 'background-image': backgroudImage }"
    class="login-box"
  >
    <div style="height: 50px">
      <a-row type="flex" justify="space-around">
        <a-col :span="4" style="line-height: 50px">智识书店</a-col>
        <a-col :span="4"></a-col>
      </a-row>
    </div>

    <div>
      <a-form :form="form" class="login-form" @submit="handleSubmit">
        <a-form-item>
          <a-input
            v-decorator="[
              'username',
              { rules: [{ required: true, message: '请输入用户名' }] }
            ]"
            placeholder="用户名"
          >
            <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
        <a-form-item>
          <a-input
            v-decorator="[
              'password',
              { rules: [{ required: true, message: '请输入密码!' }] }
            ]"
            type="password"
            placeholder="密码"
          >
            <a-icon slot="prefix" type="lock" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
        <a-form-item>
          <!--<router-link to="/forget_pwd" class="login-form-forgot">忘记密码</router-link>-->
          <a-button
            :loading="loading.login"
            type="primary"
            html-type="submit"
            class="login-form-button"
            >登录</a-button
          >
          <router-link to="/reg">立即注册！</router-link>
          <router-link to="/" style="float: right">返回主页</router-link>
        </a-form-item>
      </a-form>
    </div>
  </div>
</template>

<script>
import { Post } from "@itning/axios-helper";
import { API } from "../api";
import { analyze, LOCAL_STORAGE_KEY } from "../user";

export default {
  name: "Login",
  data: () => ({
    backgroudImage: "url('./背景.jpg')",

    loading: {
      login: false
    }
  }),
  methods: {
    handleSubmit(e) {
      e.preventDefault();
      this.form.validateFields((err, values) => {
        if (!err) {
          this.loading.login = true;
          Post(API.user.login)
            .withSuccessCode(200)
            .withURLSearchParams(values)
            .withErrorStartMsg("登陆失败：")
            .withOnceMsg()
            .do(response => {
              console.log(response.data.data);
              const roleId = analyze(response.data.data).role.id;
              if (roleId === "1") {
                window.localStorage.setItem(
                  LOCAL_STORAGE_KEY,
                  response.data.data
                );
                window.location.href =
                  window.location.protocol +
                  "//" +
                  window.location.host +
                  "/admin";
              } else {
                window.localStorage.setItem(
                  LOCAL_STORAGE_KEY,
                  response.data.data
                );
                let location = this.$store.state.now_path;
                if (location === "" || location.startsWith("/admin")) {
                  location =
                    window.location.protocol + "//" + window.location.host;
                }
                window.location.href = location;
              }
            })
            .doAfter(() => {
              this.loading.login = false;
            });
        }
      });
    }
  },
  beforeCreate() {
    this.form = this.$form.createForm(this, { name: "normal_login" });
  }
};
</script>

<style scoped>
.login-box {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  width: 100%;
  height: 747px;
}

.login-form {
  border-radius: 10px;
  opacity: 1;
  position: absolute;
  bottom: 250px;

  margin-left: 37%;

  padding: 24px;
  min-width: 420px;
  background-color: #ffffff;
}

.login-form-forgot {
  float: right;
}

.login-form-button {
  width: 100%;
}
</style>
