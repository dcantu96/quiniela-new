<template>
  <a-form :form="form" @submit.prevent="updateTeam" theme="dark">
    <a-form-item>
      <a-input v-decorator="['name']" type="text" placeholder="Namekk">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-input v-decorator="['abbreviation']" type="text" placeholder="Abbreviation">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-input v-decorator="['sport']" type="text" placeholder="Sport">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-button type="primary" html-type="submit">Create</a-button>
    </a-form-item>
  </a-form>
</template>

<script>
export default {
  middleware: "auth",
  beforeCreate() {
    this.form = this.$form.createForm(this);
  },

  methods: {
    async updateTeam() {
      try {
        const config = {
          headers: {
            "Content-Type": "application/vnd.api+json"
          }
        };
        const team = {
          data: {
            type: "teams",
            attributes: {
              name: this.form.getFieldValue("name"),
              abbreviation: this.form.getFieldValue("abbreviation")
            },
            relationships: {
              sport: {
                data: {
                  type: "sports",
                  id: this.form.getFieldValue("abbreviation")
                }
              }
            }
          }
        };
        await this.$axios.post("/teams", team, config);
        this.$toast.success("Team updated successfully!");
      } catch (e) {
        console.log(e);
        this.$toast.error("Error while authenticating");
      }
    }
  }
};
</script>
<style>
.button-add {
  margin-bottom: 10px;
}
</style>