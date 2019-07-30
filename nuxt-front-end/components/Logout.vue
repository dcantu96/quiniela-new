<template>
  <div>
    <a-button type="primary" v-on:click="logout">Logout</a-button>
  </div>
</template>

<script>
export default {
  // middleware: "auth",
  methods: {
    async logout() {
      await this.$auth.logout();
      this.$toast.success("Logged Out!");
    }
  }
};
</script>