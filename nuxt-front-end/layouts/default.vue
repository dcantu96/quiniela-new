<template>
  <a-layout id="components-layout-demo-fixed">
    <top-navigation />
    <notification />
    <a-layout-content class="outer-container">
      <breadcrumb />
      <div class="content">
        <nuxt />
      </div>
    </a-layout-content>
    <footer />
  </a-layout>
</template>

<script>
import TopNavigation from "~/components/TopNavigation.vue";
import Footer from "~/components/Footer.vue";
import Breadcrumb from "~/components/Breadcrumb.vue";
import Notification from "~/components/Notification";
import { Button } from "ant-design-vue";

export default {
  components: {
    TopNavigation,
    Footer,
    Breadcrumb,
    Notification
  }
};
</script>
<style>
#components-layout-demo-fixed .logo {
  width: 120px;
  height: 31px;
  background: rgba(255, 255, 255, 0.2);
  margin: 16px 24px 16px 0;
  float: left;
}

#components-layout-demo-fixed .signed-out {
  margin: 10px 24px 10px 0;
  float: right;
}

#components-layout-demo-fixed .signed-in {
  margin-right: 10px;
  float: right;
}

html {
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  margin: 0;
}

.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  color: #3b8070;
  text-decoration: none;
  padding: 10px 30px;
}

.button--green:hover {
  color: #fff;
  background-color: #3b8070;
}

.button--grey {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #35495e;
  color: #35495e;
  text-decoration: none;
  padding: 10px 30px;
  margin-left: 15px;
}

.button--grey:hover {
  color: #fff;
  background-color: #35495e;
}

.outer-container {
  padding: 0 50px;
  margin-top: 64px;
  margin-bottom: 64px;
}
.content {
  background: #fff;
  padding: 24px;
  min-height: 380px;
}
</style>
