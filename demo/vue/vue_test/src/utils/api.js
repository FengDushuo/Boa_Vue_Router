/* eslint-disable no-undef */
/* eslint-disable eqeqeq */
/* eslint-disable space-before-blocks */
// 引入axios，先安装npm install axios
import axios from 'axios'
import router from '@/router'
import store from '../store/store'

// 请求拦截器
axios.interceptors.request.use(config => {
  // 如果存在token，请求携带token
  if (store.state.token){
    config.headers.common['token'] = store.state.token
  }
  return config
}, error => {
  console.log(error)
})

// 响应拦截器
axios.interceptors.response.use(success => {
  // 业务逻辑错误
  if (success.status && success.status == 200) {
    if (success.data.code == 500 || success.data.code == 401 || success.data.code == 403) {
      Message.error({ message: success.data.message })
      return
    }
    if (success.data.message) {
      console.log(success.data.message)
      // Message.success({ message: success.data.message });
    }
  }
  return success.data
}, error => {
  // 接口访问失败
  if (error.response.code == 504 || error.response.code == 404) {
    Message.error({ message: '服务生气了' })
  } else if (error.response.code == 403) {
    Message.error({ message: '权限不足' })
  } else if (error.response.code == 401) {
    Message.error({ message: '尚未登录,请登录' })
    router.replace('/')
  } else {
    if (error.response.data.message) {
      Message.error({ message: error.response.data.message })
    } else {
      Message.error({ message: '未知错误!' })
    }
  }
})

let base = ''

// 传送json格式的post请求
export const postRequest = (url, params) => {
  return axios({
    method: 'post',
    url: base + url,
    data: params
  })
}

// 传送json的put请求
export const putRequest = (url, params) => {
  return axios({
    method: 'put',
    url: base + url,
    data: params
  })
}

// 传送json的get请求
export const getRequest = (url, params) => {
  return axios({
    method: 'get',
    url: base + url,
    data: params
  })
}

// 传送json的delete请求
export const deleteRequest = (url, params) => {
  return axios({
    method: 'delete',
    url: base + url,
    data: params
  })
}
