<script setup lang="ts">
import { computed } from 'vue'
import { useNav, useSlideContext } from '@slidev/client'

// Section tracker: mark the first slide of a section with `section: <name>` in
// its frontmatter. Decks without any `section:` frontmatter render nothing.
const { slides } = useNav()
const { $page } = useSlideContext()

const sectionOf = (i: number) => slides.value[i]?.meta?.slide?.frontmatter?.section as string | undefined

const sections = computed(() => [...new Set(slides.value.map((_, i) => sectionOf(i)).filter(Boolean))])
const active = computed(() => {
  for (let i = $page.value - 1; i >= 0; i--) {
    if (sectionOf(i)) return sectionOf(i)
  }
})
</script>

<template>
  <div v-if="sections.length" class="cd-timeline">
    <template v-for="(s, i) in sections" :key="s">
      <span v-if="i" class="cd-timeline-line" />
      <span class="cd-chip" :class="s === active ? 'cd-chip-active' : 'cd-chip-inactive'">{{ s }}</span>
    </template>
  </div>
</template>
