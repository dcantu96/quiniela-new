<template>
  <a-form :form="form" @submit.prevent="createTeam" theme="dark">
    <a-form-item>
      <a-input v-decorator="['name']" type="text" placeholder="Name">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-input v-decorator="['abbreviation']" type="text" placeholder="Abbreviation">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-select
        v-decorator="[
          'sport',
          {rules: [{ required: true, message: 'Please select sport!' }]}
        ]"
        placeholder="Please select a sport"
      >
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
        <a-select-option value="1">NFL Football</a-select-option>
        <a-select-option value="2">MLB Baseball</a-select-option>
      </a-select>
    </a-form-item>
    <a-form-item>
      <a-button type="primary" html-type="submit">Create</a-button>
    </a-form-item>
  </a-form>
</template>

<script>
import JsonApi from "devour-client";
export default {
  middleware: "auth",
  async asyncData({ $axios, route, params, $auth }) {
    const jsonApi = new JsonApi({ apiUrl: "http://localhost:8080/api/v1" });
    jsonApi.headers["Authorization"] = $auth.getToken("local");
    jsonApi.define("team", {
      name: "",
      abbreviation: "",
      sport: {
        jsonApi: "hasOne",
        type: "sports"
      }
    });
    jsonApi.define("sport", {
      name: "",
      teams: {
        jsonApi: "hasMany",
        type: "teams"
      },
      tournaments: {
        jsonApi: "hasMany",
        type: "tournaments"
      }
    });
    let { data, errors, meta, links } = await jsonApi.findAll("sports");
    return { data };
  },
  beforeCreate() {
    this.form = this.$form.createForm(this);
  },

  methods: {
    async createTeam() {
      try {
        const jsonApi = new JsonApi({ apiUrl: "http://localhost:8080/api/v1" });
        jsonApi.headers["Authorization"] = this.$auth.getToken("local");
        jsonApi.define("team", {
          name: "",
          abbreviation: "",
          sport: {
            jsonApi: "hasOne",
            type: "sports"
          }
        });
        jsonApi.define("sport", {
          name: "",
          teams: {
            jsonApi: "hasMany",
            type: "teams"
          },
          tournaments: {
            jsonApi: "hasMany",
            type: "tournaments"
          }
        });
        await jsonApi.create("team", {
          id: this.data.id,
          name: this.form.getFieldValue("name"),
          abbreviation: this.form.getFieldValue("abbreviation"),
          sport: {
            id: this.form.getFieldValue("sport")
          }
        });
        this.$toast.success("Team created successfully!");
      } catch (e) {
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