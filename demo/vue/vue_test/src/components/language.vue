<template>
  <el-dropdown class="lang-container hover-pointer" trigger="click">
    <span >{{ language }} <i class="el-icon-caret-bottom el-icon--right" />
    </span>
    <el-dropdown-menu slot="dropdown">
      <el-dropdown-item @click.native="changeLangauge('zh')">
        <span style="display:block;">简体中文</span>
      </el-dropdown-item>
      <el-dropdown-item @click.native="changeLangauge('en')">
        <span style="display:block;">English</span>
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>
<script>
export default {
  name: 'Language',
  data () {
    return {
      language: ''
    }
  },
  created () {
    this.showLangauge()
  },
  methods: {
    showLangauge () {
      const currentLang = window.localStorage.getItem('lang') || 'zh'
      switch (currentLang) {
        case 'zh':
          this.language = '简体中文'
          break
        case 'en':
          this.language = 'English'
          break
      }
    },
    changeLangauge (lang) {
      this.$i18n.locale = lang
      localStorage.setItem('lang', lang)
      this.showLangauge()
    }
  }
}
</script>
<!-- <style lang="scss">
.hover-pointer {
  span {
    cursor: pointer
  }
}
</style> -->
