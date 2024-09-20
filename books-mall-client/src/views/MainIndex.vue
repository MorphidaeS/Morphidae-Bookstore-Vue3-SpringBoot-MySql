<template>
  <a-layout
    class="mainindex"
    v-bind:style="{ 'background-image': backgroudImage }"
  >
    <a-layout-header style="background-color: #f0f2f5">
      <LayoutHeader />
    </a-layout-header>

    <a-layout-content style="margin: 0 50px">
      <a-back-top />
      <router-view name="subContent" />
    </a-layout-content>
  </a-layout>
</template>

<script>
import LayoutHeader from "../components/LayoutHeader";

export default {
  name: "MainIndex",
  components: { LayoutHeader },
  data: () => ({ backgroudImage: "url('./背景.jpg')", collapsed: false }),
  methods: {
    handleAdminBtnClick() {
      this.$router.push("/admin").catch(error => {});
    }
  }
};
</script>

<style scoped>
.mainindex {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  width: 100%;
}
</style>
