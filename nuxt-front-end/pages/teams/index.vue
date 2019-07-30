<template>
  <div>
    <n-link to="/teams/new">
      <a-button class="button-add">New Team</a-button>
    </n-link>
    <a-table :columns="columns" :dataSource="data" bordered size="middle" rowKey="id">
      <template slot="operation" slot-scope="text, record">
        <div class="editable-row-operations">
          <span>
            <a-button type="primary">
              <n-link :to="{name: 'teams-id-edit', params: { id:record.id } }">Edit Team</n-link>
            </a-button>
            <a-popconfirm
              v-if="data.length"
              title="Sure to delete?"
              @confirm="() => deleteTeam(record)"
            >
              <a-button type="danger" shape="circle" icon="cross"></a-button>
            </a-popconfirm>
          </span>
        </div>
      </template>
    </a-table>
  </div>
</template>
<script>
import JsonApi from "devour-client";
export default {
  middleware: "auth",
  async asyncData({ $axios, $auth }) {
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
    let { data, errors, meta, links } = await jsonApi.findAll("teams", {
      include: "sport"
    });
    return { data };
  },
  data() {
    return {
      columns: [
        {
          title: "Name",
          dataIndex: "name",
          scopedSlots: { customRender: "name" }
        },
        {
          title: "Abbreviation",
          dataIndex: "abbreviation",
          scopedSlots: { customRender: "abbreviation" }
        },
        {
          title: "Sport",
          dataIndex: "sport.name",
          scopedSlots: { customRender: "sport" }
        },
        {
          title: "operation",
          scopedSlots: { customRender: "operation" }
        }
      ]
    };
  },
  methods: {
    async deleteTeam(record) {
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
        await jsonApi.destroy("team", record.id);
        const data = [...this.data];
        this.data = data.filter(item => item.id !== record.id);
        this.$toast.success("Delete team successfully!");
      } catch (e) {
        this.$toast.error(e);
      }
    },
    async addTeam(record) {
      try {
        await this.$axios.post("/teams", {
          team: {
            name: this.form.getFieldValue("name"),
            abbreviation: this.form.getFieldValue("aabbreviationb"),
            sport_id: this.form.getFieldValue("sport")
          }
        });
        const dataSource = [...this.dataSource];
        this.dataSource = dataSource.filter(item => item.id !== record.id);
        this.$toast.success("Delete team successfully!");
      } catch (e) {
        this.$toast.error(e);
      }
    },
    handleChange(value, id, column) {
      const newData = [...this.dataSource];
      const target = newData.filter(item => id === item.id)[0];
      if (target) {
        target[column] = value;
        this.dataSource = newData;
      }
    },
    handleAdd() {
      const { dataSource } = this;
      const newTeam = {
        name: "",
        abbreviation: "",
        sport_id: ""
      };
      this.dataSource = [...dataSource, newTeam];
    },
    edit(id) {
      const newData = [...this.dataSource];
      const target = newData.filter(item => id === item.id)[0];
      if (target) {
        target.editable = true;
        this.dataSource = newData;
      }
    },
    save(id) {
      const newData = [...this.dataSource];
      const target = newData.filter(item => id === item.id)[0];
      if (target) {
        delete target.editable;
        this.dataSource = newData;
        this.cacheData = newData.map(item => ({ ...item }));
      }
    },
    cancel(id) {
      const newData = [...this.dataSource];
      const target = newData.filter(item => id === item.id)[0];
      if (target) {
        Object.assign(target, this.cacheData.filter(item => id === item.id)[0]);
        delete target.editable;
        this.dataSource = newData;
      }
    }
  }
};
</script>
<style scoped>
.button-add {
  margin-bottom: 10px;
}
.editable-row-operations a {
  margin-right: 8px;
}
</style>