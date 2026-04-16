<script setup lang="ts">
import { useNav } from '@slidev/client'

const { currentPage, total, isPrintMode } = useNav()
</script>

<template>
  <div v-if="!isPrintMode" class="global-footer">
    <div class="global-footer-inner">
      <span class="global-footer-logo-wrap">
        <img
          src="/images/tero_logo_black.svg"
          alt="Tero"
          class="global-footer-logo"
        >
      </span>
      <span class="global-footer-sep" />
      <span class="global-footer-counter">{{ currentPage }} / {{ total }}</span>
    </div>
  </div>
</template>

<style scoped>
.global-footer {
  position: fixed;
  right: 18px;
  bottom: 14px;
  z-index: 60;
  pointer-events: none;
}

.global-footer-inner {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  border-radius: 999px;
  padding: 5px 10px 5px 6px;
  border: 1px solid rgb(145 221 255 / 26%);
  background: rgb(16 14 35 / 76%);
  backdrop-filter: blur(6px);
  color: #cbe3e7;
  font-size: 12px;
  line-height: 1;
}

.global-footer-logo-wrap {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 22px;
  height: 22px;
  border-radius: 999px;
  background: #fff;
}

.global-footer-logo {
  width: 11px;
  height: 22px;
  display: block;
}

.global-footer-sep {
  width: 1px;
  height: 14px;
  background: rgb(166 179 204 / 45%);
}

.global-footer-counter {
  font-weight: 600;
  letter-spacing: 0.01em;
}
</style>
