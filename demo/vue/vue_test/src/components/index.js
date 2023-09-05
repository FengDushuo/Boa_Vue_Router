// import Vue from 'vue'
import HelloWorld from './HelloWorld'
import Hello from './Hello'
import login from './login'
import Language from './language'

let ModuleObj = {
  HelloWorld,
  Hello,
  login,
  Language
}
let MyModule = {}
MyModule.install = (Vue) => {
  for (let i in ModuleObj) {
    Vue.component(i, ModuleObj[i])
  }
}

export default MyModule
