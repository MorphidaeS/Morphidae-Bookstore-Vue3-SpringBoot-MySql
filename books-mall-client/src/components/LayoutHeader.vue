<template>
  <div>
    <a-row type="flex" justify="space-between">
      <a-col :xs="0" :sm="8" :md="8" :lg="8" :xl="8">
        <router-link to="/">
          <div class="rainbow-text">智识书店</div>
        </router-link>
      </a-col>
      <a-col :xs="24" :sm="8" :md="8" :lg="8" :xl="8">
        <a-input-search
          placeholder="搜索书籍"
          @search="searchProduct"
          enterButton
          style="vertical-align: middle;"
        />
      </a-col>
      <a-col :xs="0" :sm="8" :md="8" :lg="8" :xl="8">
        <a-row type="flex" justify="end">
          <a-col :xs="0" :sm="8" :md="7" :lg="5" :xl="4">
            <a-config-provider :autoInsertSpaceInButton="false">
              <a-button type="link" @click="handleOrderBtnClick"
                >我的订单</a-button
              >
            </a-config-provider>
          </a-col>
          <a-col :xs="0" :sm="10" :md="9" :lg="6" :xl="5">
            <a-config-provider :autoInsertSpaceInButton="false">
              <a-button type="link" @click="handleCartBtnClick">
                <a-icon type="shopping-cart" />
                购物车
              </a-button>
            </a-config-provider>
          </a-col>
          <a-col
            :xs="0"
            :sm="6"
            :md="7"
            :lg="5"
            :xl="5"
            v-if="$user.loginUser().username"
          >
            <a-dropdown class="user-btn">
              <a class="ant-dropdown-link">
                {{ $user.loginUser().username }}
                <a-icon type="down" />
              </a>
              <a-menu slot="overlay">
                <a-menu-item>
                  <a @click="handlePersonalBtnClick">个人中心</a>
                </a-menu-item>
                <a-menu-item>
                  <a @click="handleLogoutBtnClick">注销登录</a>
                </a-menu-item>
              </a-menu>
            </a-dropdown>
          </a-col>
          <a-col
            :xs="0"
            :sm="5"
            :md="4"
            :lg="3"
            :xl="3"
            v-if="!$user.loginUser().username"
          >
            <a-config-provider :autoInsertSpaceInButton="false">
              <a-button type="link" @click="handleLoginBtnClick">登录</a-button>
            </a-config-provider>
          </a-col>
          <a-col
            :xs="0"
            :sm="1"
            :md="2"
            :lg="4"
            :xl="4"
            v-if="!$user.loginUser().username"
          >
            <a-config-provider :autoInsertSpaceInButton="false">
              <a-button type="link" @click="handleRegBtnClick">注册</a-button>
            </a-config-provider>
          </a-col>
        </a-row>
      </a-col>
    </a-row>
  </div>
</template>

<script>
import { LOCAL_STORAGE_KEY } from "../user";

export default {
  name: "LayoutHeader",
  methods: {
    handlePersonalBtnClick() {
      this.$router.push("/personal").catch(err => {});
    },
    handleLogoutBtnClick() {
      localStorage.removeItem(LOCAL_STORAGE_KEY);
      this.$router.push("/login").catch(err => {});
    },
    handleLoginBtnClick() {
      this.$router.push("/login").catch(err => {});
    },
    handleRegBtnClick() {
      this.$router.push("/reg").catch(err => {});
    },
    handleOrderBtnClick() {
      this.$router.push("/order").catch(err => {});
    },
    handleCartBtnClick() {
      this.$router.push("/cart").catch(err => {});
    },
    searchProduct(value) {
      if (!value || value.trim() === "" || value.trim().startsWith("\\")) {
        this.$router.push("/").catch(err => {});
        return;
      }
      this.$router.push("/search/" + value).catch(err => {});
    }
  }
};
</script>

<style scoped></style>
