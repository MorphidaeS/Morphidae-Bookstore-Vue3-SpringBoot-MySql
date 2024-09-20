<template>
  <div style="height: 100%">
    <a-config-provider :locale="locale">
      <router-view />
    </a-config-provider>
  </div>
</template>

<script>
import zh_CN from "ant-design-vue/lib/locale-provider/zh_CN";

export default {
  name: "App",
  data: () => ({ locale: zh_CN }),
  methods: {}
};
</script>

<style>
/*阴影效果*/
.box-shadow {
  box-shadow: 5px 5px 8px 2px #e4e4e4;
}

/*阴影效果：鼠标移入*/
.box-shadow:hover {
  box-shadow: 0 1px 8px 2px #e4e4e4;
}

/*圆角效果*/
.box-radius {
  border-radius: 15px;
}
@keyframes hue {
  from {
    filter: hue-rotate(0);
  }

  to {
    filter: hue-rotate(360deg);
  }
}

.rainbow-text {
  margin-left: 8px;
  display: inline-block;
  position: relative;
  font-size: 2em;
  color: transparent;

  background-color: rgb(38, 102, 251);
  -webkit-background-clip: text;
}
</style>
