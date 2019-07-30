<template>
  <a-alert :message="message" type="success" />
</template>

<script>
export default {
  name: "Notification",
  props: ["message"]
};
</script>