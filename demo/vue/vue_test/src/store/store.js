/* eslint-disable no-undef */
/* eslint-disable no-tabs */
/* eslint-disable no-mixed-spaces-and-tabs */
//  store.js 中都mutation中增加添加和删除token的方法
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = { // 全局管理的数据存储
	 isLogin: '0',
	 ser: null,
	 token: localStorage.getItem('token') ? localStorage.getItem('token') : '' // token
}
export default new Vuex.Store({
  state,
  getters: { // 监听数据变化的
    getStorage (state) { // 获取本地存储的登录信息
	      if (!state.token) {
	        state.token = JSON.parse(localStorage.getItem(key))
	      }
	      return state.token
	    }
  },
  mutations: {
    $_setToken (state, value) { // 设置存储token
	        state.token = value
	        localStorage.setItem('token', value)
	    },
	    $_removeStorage (state, value) { // 删除token
		      localStorage.removeItem('token')
	    }
  }
})
