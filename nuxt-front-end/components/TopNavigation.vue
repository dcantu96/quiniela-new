<template>
  <a-layout-header :style="{ position: 'fixed', zIndex: 1, width: '100%' }">
    <div class="logo" />
    <div class="signed-in" v-if="this.$auth.loggedIn">
      <logout />
    </div>
    <div class="signed-out" v-else>
      <login />
    </div>
    <a-menu
      theme="dark"
      mode="horizontal"
      :defaultSelectedKeys="['2']"
      :style="{ lineHeight: '64px' }"
    >
      <a-menu-item key="1" v-if="this.$auth.loggedIn">{{this.$auth.user.name}}</a-menu-item>
      <a-menu-item key="2" v-if="this.$auth.loggedIn">
        <n-link to="/teams">Teams</n-link>
      </a-menu-item>
      <a-menu-item key="3" v-if="this.$auth.loggedIn === false">
        <n-link to="/register">Register</n-link>
      </a-menu-item>
    </a-menu>
  </a-layout-header>
</template>

<script>
import Login from "~/components/Login.vue";
import Logout from "~/components/Logout.vue";

export default {
  components: {
    Login,
    Logout
  }
};
</script>


