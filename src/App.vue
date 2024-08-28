<script setup>
import { onMounted, ref } from "vue";
const liff = ref(null);
const userdetail = ref(null);
onMounted(() => {
  window.liff
    .init({
      liffId: "2006162705-04eyRrOr", // Use own liffId
    })
    .then(async () => {
      // Redirect to another page after the returned Promise object has been resolved
      // location.replace("https://line.me/{liffId}/path");
      liff.value = window.liff;
      console.log(liff.value.getOS());
      if (!liff.value.isLoggedIn()) {
        liff.value.login();
        return;
      }
      const res = await liff.value.getProfile();
      userdetail.value.pictureUrl = res.pictureUrl;
      userdetail.value.displayName = res.displayName;
    });
});
</script>

<template>
  liff website
  <br />
  สวัสดี &nbsp;
  {{ userdetail?.displayName }}
  <br />
  <img
    v-if="userdetail && userdetail.pictureUrl"
    :src="userdetail?.pictureUrl"
    alt=""
  />
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
