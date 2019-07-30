<template>
  <div>
    <ul>
      <li v-for="match in matches">
        <p>Match: {{match.id}}</p>
        <p>Date: {{match.attributes.date}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import Notification from "~/components/Notification";

export default {
  middleware: "auth",
  async asyncData({ $axios }) {
    const json = await $axios.$get("/matches");
    const matches = json.data;
    return { matches };
  }
};
</script>