<template>
  <a-form :form="form" @submit="updateTeam" theme="dark">
    <a-form-item>
      <a-input v-decorator="['name', { initialValue: data.name }]" type="text">
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-input
        v-decorator="['abbreviation', { initialValue: data.abbreviation }]"
        type="text"
        placeholder="Abbreviation"
      >
        <a-icon slot="prefix" type="user" style="color: rgba(0,0,0,.25)" />
      </a-input>
    </a-form-item>
    <a-form-item>
      <a-select
        v-decorator="[
          'sport',
          { initialValue: data.sport.id },
          {rules: [{ required: true, message: 'Please select sport!' }]}
        ]"
        placeholder="Please select a sport"
      >
        <a-select-option value="1">NFL Football</a-select-option>
        <a-select-option value="2">MLB Baseball</a-select-option>
      </a-select>
    </a-form-item>
    <a-form-item>
      <a-button type="primary" html-type="submit">Update</a-button>
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
    let { data, errors, meta, links } = await jsonApi.find(
      "team",
      route.params.id,
      {
        include: "sport"
      }
    );
    return { data };
  },
  beforeCreate() {
    this.form = this.$form.createForm(this);
  },
  methods: {
    async updateTeam() {
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
        await jsonApi.update("team", {
          id: this.data.id,
          name: this.form.getFieldValue("name"),
          abbreviation: this.form.getFieldValue("abbreviation"),
          sport: {
            id: this.form.getFieldValue("sport")
          }
        });
        this.$toast.success("Team updated successfully!");
        this.$router.push("/teams");
      } catch (e) {
        this.$toast.error("Error while updating team!");
      }
    }
  }
};
</script>