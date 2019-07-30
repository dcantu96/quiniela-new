<template>
  <a-form :form="form" class="login-form" @submit.prevent="register" theme="dark">
    <a-row :gutter="24">
      <a-col :span="12">
        <a-form-item :validate-status="emailError() ? 'error' : ''" :help="emailError() || ''">
          <a-input
            v-decorator="[
              'email',
              {rules: [{ required: true, message: 'Please input your email!' }]}
            ]"
            type="email"
            placeholder="Email"
          >
            <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
      <a-col :span="12">
        <a-form-item
          :validate-status="userNameError() ? 'error' : ''"
          :help="userNameError() || ''"
        >
          <a-input
            v-decorator="[
              'username',
              {rules: [{ required: true, message: 'Please input your username!' }]}
            ]"
            type="text"
            placeholder="Username"
          >
            <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
    </a-row>
    <a-row :gutter="24">
      <a-col :span="12">
        <a-form-item :validate-status="nameError() ? 'error' : ''" :help="nameError() || ''">
          <a-input
            v-decorator="[
              'name',
              {rules: [{ required: true, message: 'Please input your first name!' }]}
            ]"
            type="text"
            placeholder="First Name"
          >
            <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
      <a-col :span="12">
        <a-form-item
          :validate-status="lastNameError() ? 'error' : ''"
          :help="lastNameError() || ''"
        >
          <a-input
            v-decorator="[
              'last_name',
              {rules: [{ required: true, message: 'Please input your last name!' }]}
            ]"
            type="text"
            placeholder="Last Name"
          >
            <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
    </a-row>
    <a-row :gutter="24">
      <a-col :span="12">
        <a-form-item
          :validate-status="passwordError() ? 'error' : ''"
          :help="passwordError() || ''"
        >
          <a-input
            v-decorator="[
              'password',
              {rules: [{ required: true, message: 'Please input your password!' }]}
            ]"
            type="password"
            placeholder="Password"
          >
            <a-icon slot="prefix" type="lock" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
      <a-col :span="12">
        <a-form-item
          :validate-status="passwordConfirmationError() ? 'error' : ''"
          :help="passwordConfirmationError() || ''"
        >
          <a-input
            v-decorator="[
              'password_confirmation',
              {rules: [{ required: true, message: 'Please re-enter your password!' }]}
            ]"
            type="password"
            placeholder="Confirm Password"
          >
            <a-icon slot="prefix" type="lock" style="color: rgba(0,0,0,.25)" />
          </a-input>
        </a-form-item>
      </a-col>
    </a-row>
    <a-form-item>
      <a-button
        :disabled="hasErrors(form.getFieldsError())"
        type="primary"
        html-type="submit"
        class="login-form-button"
      >Register</a-button>
    </a-form-item>
  </a-form>
</template>


<script>
function hasErrors(fieldsError) {
  return Object.keys(fieldsError).some(field => fieldsError[field]);
}
export default {
  beforeCreate() {
    this.form = this.$form.createForm(this);
  },
  data() {
    return {
      hasErrors,
      form: this.$form.createForm(this)
    };
  },
  mounted() {
    this.$nextTick(() => {
      // To disabled submit button at the beginning.
      this.form.validateFields();
    });
  },

  methods: {
    // Only show error after a field is touched.
    userNameError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("username") && getFieldError("username");
    },
    passwordError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("password") && getFieldError("password");
    },
    passwordConfirmationError() {
      const { getFieldError, isFieldTouched } = this.form;
      return (
        isFieldTouched("password_confirmation") &&
        getFieldError("password_confirmation")
      );
    },
    emailError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("email") && getFieldError("email");
    },
    nameError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("name") && getFieldError("name");
    },
    lastNameError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("last_name") && getFieldError("last_name");
    },
    showErrors(errors) {
      if (errors.email === "errors") {
        return this.$toast.error("Email can't be blank");
      }
    },
    async register() {
      try {
        let response = await this.$axios.post(
          "http://localhost:8080/api/v1/users",
          {
            user: {
              email: this.form.getFieldValue("email"),
              username: this.form.getFieldValue("username"),
              name: this.form.getFieldValue("name"),
              last_name: this.form.getFieldValue("last_name"),
              password: this.form.getFieldValue("password"),
              password_confirmation: this.form.getFieldValue(
                "password_confirmation"
              )
            }
          }
        );
        this.$toast.success("Registered Successfully!");
        await this.$auth.loginWith("local", {
          data: {
            email: response.data.email,
            password: this.form.getFieldValue("password"),
            grant_type: "password"
          }
        });
        this.$toast.success("Logged In!");
      } catch (e) {
        if (e.response.data.errors.hasOwnProperty("email")) {
          this.$toast.error("Email " + e.response.data.errors.email);
        }
        if (e.response.data.errors.hasOwnProperty("password")) {
          this.$toast.error("Password " + e.response.data.errors.password);
        }
        if (e.response.data.errors.hasOwnProperty("password_confirmation")) {
          this.$toast.error(
            "Password " + e.response.data.errors.password_confirmation
          );
        }
        if (e.response.data.errors.hasOwnProperty("username")) {
          this.$toast.error("Username " + e.response.data.errors.username);
        }
        if (e.response.data.errors.hasOwnProperty("name")) {
          this.$toast.error("Name " + e.response.data.errors.name);
        }
        if (e.response.data.errors.hasOwnProperty("last_name")) {
          this.$toast.error("Last name " + e.response.data.errors.last_name);
        }
      }
    }
  }
};
</script>