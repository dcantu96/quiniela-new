<template>
  <a-form :form="form" class="login-form" @submit.prevent="login" layout="inline" theme="dark">
    <a-form-item>
      <a-input v-decorator="['email-top']" type="email" placeholder="Email">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-input v-decorator="['password-top']" type="password" placeholder="Password">
        <a-icon slot="prefix" type="lock" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-button type="primary" html-type="submit" class="login-form-button">Log in</a-button>
    </a-form-item>
  </a-form>
</template>

<script>
export default {
  beforeCreate() {
    this.form = this.$form.createForm(this);
  },

  methods: {
    async login() {
      try {
        await this.$auth.loginWith("local", {
          data: {
            email: this.form.getFieldValue("email-top"),
            password: this.form.getFieldValue("password-top"),
            grant_type: "password"
          }
        });
        this.$toast.success("Logged In!");
      } catch (e) {
        this.$toast.error("Error while authenticating");
      }
    }
  }
};
</script>