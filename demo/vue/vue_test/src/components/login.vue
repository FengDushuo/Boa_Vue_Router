/* eslint-disable standard/object-curly-even-spacing */
/* eslint-disable standard/object-curly-even-spacing */
/* eslint-disable standard/object-curly-even-spacing */
/* eslint-disable eqeqeq */
/* eslint-disable eqeqeq */
/* eslint-disable no-undef */
/* eslint-disable no-undef */
/* eslint-disable vue/no-parsing-error */
/* eslint-disable vue/no-parsing-error */

/* eslint-disable */
<template>
  <body onload="LoadFrame()">
    <div id="changeBrower" style="display: none;">
        <h2>当前使用的浏览器版本过低，请使用更高版本的浏览器登录！推荐使用Edge浏览器和谷歌浏览器。</h2>
    </div>
    <div id="bodyShow" style="display: block;">
        <div class="header"><div class="logo_img"></div></div>
        <Language class="lanuage-component" />
        <div id=div_visite>
        <form id="ConfigForm" name="ConfigForm" method="post" :model="loginParam" :rules="loginRules">
        <div class="lmain">
        <div class="lmain-inner">
            <div class="text-center">{{ this.$t('login.title') }}
            </div>
        <div id="loginForm" class="form">
            <div class="form-group" style="margin-top: 25px;" prop="username">
                <div class="form-title">
                    {{ $t('login.usernameTap') }}
                </div>
                <div class="input">
                    <input id="Username" name="Username" autocomplete="on" type="text" size="20" v-model="loginParam.username">
                </div>
            </div>
            <div class="form-group" prop="password">
                <div class="form-title">
                    {{ $t('login.passwordTap') }}
                </div>
                <div class="input" style="position: relative;">
                    <input id="Logoff" type="hidden" name="Logoff" value="0">
                    <input id="hLoginTimes" type="hidden" name="hLoginTimes" value="0">
                    <input id="hLoginTimes_Zero" type="hidden" name="hLoginTimes_Zero" value="0">
                    <input id="value_one" type="hidden" name="value_one" value="1">
                    <input id="Username1" type="hidden" name="Username1" value="">
                    <input id="Username2" type="hidden" name="Username2" value="">
                    <input id="Password1" type="hidden" name="Password1" value="">
                    <input id="Password2" type="hidden" name="Password2" value="">
                    <input id="logintype" type="hidden" name="logintype" value="usr">
                    <input id="LoginFailTime" type="hidden" name="LoginFailTime" value="0">
                    <input id="hLoginFailTime" type="hidden" name="hLoginFailTime" value="0">
                    <div style="position: relative;">
                        <input id="Password" v-bind:type="pwd_icon.passwordType" name="Password" size="20"
                            autocomplete="off" oncopy="return false;" oncut="return false;"
                            oncontextmenu="return false;" v-model="loginParam.password">
                        <div v-bind:class='pwd_icon.pwdClass' id="cb_enablshowpsw" v-bind:data-flag='pwd_icon.dataflagvalue' @click="doshowpswChange"></div>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix" style="height: 24px;">
                <div class="remember font-pwd fl">
                    <span class="pwd-tips" style="display: inline-block;">
                    </span>
                </div>
                <div class="forget font-pwd fr">
                    <span class="forget-pwd" @click="forgetPass">忘记密码？</span>
                </div>
            </div>
            <div class="form-group" style="height: 40px;">
                    <input id="btnSubmit" @click="SubmitForm" type="button" value="登 录" name="btnSubmit" class="btn-text">
                    &nbsp;
            </div>
        </div>

        <div class="forget-form">
        </div>
        </div>
        </div>
        </form>
        </div>

        <div class="footer">
            软件版本：MAC地址：<br>
        </div>
    </div>
  </body>
</template>

<script>
// import $ from 'jquery'
// import alert from '../assets/js/popup.js'
import { Toast } from 'mint-ui'
import Language from './language.vue'

export default {
  components: {
    Language
  },
  name: 'login',
  data () {
    return {
      pwd_icon: {
        dataflagvalue: 0,
        passwordType: 'password',
        pwdClass: 'input_eye eye-pwd'
      },
      loginParam: {
        username: 'admin',
        password: '123456'
      },
      loginRules: {
        username: [{required: true, message: '请输入用户名', trigger: 'blur'}],
        password: [{required: true, message: '请输入密码', trigger: 'blur'}]
      }
    }
  },
  methods: {
    forgetPass () {
      alert('依照图示方法，可以将路由器恢复出厂设置，恢复出厂设置后您可以使用设备默认账号密码登入，但同时您的数据会被清除，请谨慎操作。', '我知道了', 'forget', require('../assets/imgs/forget.png'))
      return false
    },
    // submit () {
    //   this.$refs.login.validate(valid => {
    //     if (valid) {
    //       this.$message.success('登录成功')
    //       this.$router.push('/helloworld')
    //     } else {
    //       this.$message.error('请输入账号和密码')
    //       return false
    //     }
    //   })
    // },
    doshowpswChange () {
      // eslint-disable-next-line eqeqeq
      if (this.pwd_icon.dataflagvalue == 1) {
        this.pwd_icon.dataflagvalue = 0
        this.pwd_icon.passwordType = 'password'
        this.pwd_icon.pwdClass = 'input_eye eye-pwd'
      } else {
        this.pwd_icon.dataflagvalue = 1
        this.pwd_icon.passwordType = 'text'
        this.pwd_icon.pwdClass = 'input_eye eye-text'
      }
    },
    SubmitForm () {
      // alert(this.loginParam.username)
      this.postRequest('/cgi-bin/config_get.cgi', {'username': this.loginParam.username, 'password': this.loginParam.password}).then((res) => {
        console.log(res)
        console.log(res)
        if (res.code === 'ready') {
          console.log('登录成功')
          // 将token保存至localStorage/sessionStorage中，获取token的value值
          this.$store.commit('$_setToken', res.token)
          Toast({message: '登录成功', type: 'success', duration: 1500}) // ui弹窗提示
          this.$router.push({ name: 'Hello' }) // 跳转到首页
        } else {
          console.log('登录失败')
          Toast({message: '登录失败', type: 'error', duration: 1500})
        }
      })
    }
  }
}
</script>

<style>
@import '../assets/css/stylemain.css';
* {
    box-sizing: border-box;
    outline: none;
    border: none;
}
html,
body {
    height: 100%;
    padding: 0;
    margin: 0;
}
body {
    font-family: "MicrosoftYaHei", "Microsoft YaHei";
    background: url(../assets/imgs/bg.png) no-repeat;
    background-size: cover;
    margin: 0;
    padding: 0;
    position: relative;
}
.header {
    width: 100%;
    height: 120px;
    position: relative;
    margin: 0 auto;
}
.lanuage-component {
    position: fixed;
    top: 20px;
    right: 100px;
    color: #fff;
}
.header .logo_img {
    width: 186px;
    height: 60px;
    position: relative;
    top: 60px;
    left: 23%;
}
.app-img-text {
    width: 131px;
    height: 24px;
    font-size: 12px;
    font-family: MicrosoftYaHei;
    color: #787e7e;
    line-height: 24px;
    letter-spacing: 1px;
    padding-bottom: 14px;
}
.footer {
    width: 600px;
    height: 42px;
    line-height: 21px;
    color: #fff;
    text-align: center;
    font-size: 10px;
    letter-spacing: 0.42px;
    margin: 0 auto;
    margin-top: 95px;
}
#div_visite {
    font-size: 14px;
    margin-top: 55px;
    color: #5F6172;
    font-family: "MicrosoftYaHei", "Microsoft YaHei";
}
#div_visite .lmain {
    width: 525px;
    height: 449px;
    background: #ffffff;
    position: relative;
    -webkit-border-radius: 24px;
    -moz-border-radius: 24px;
    border-radius: 24px;
    margin: 0 auto;
    overflow: hidden;
}
#div_visite .lmain .lmain-inner {
    width: 497px;
    margin: 24px auto;
}
.lmain-inner .text-center {
    width: 100%;
    height: 63px;
    line-height: 63px;
    color: #5f6172;
    line-height: 63px;
    font-size: 24px;
}
.lmain-inner .text-center .welcome {
  font-size: 24px;
  text-align: center;
}
.lmain-inner .text-center span {
  display: block;
  font-size: 14px;
  text-align: center;
}
.lmain-inner .app-img {
    width: 120px;
    height: 144px;
    font-size: 0;
    margin: 0 auto;
}
/* 登录信息 */
.lmain-inner .form {
  margin: 0 auto;
  width: 246px;
  font-size: 0;
}
.lmain-inner .forget-form {
    font-size: 16px;
    color: #5f6172;
    margin-top: 52px;
    width: 300px;
    margin: 44px auto;
}
.lmain-inner .form .form-group {
  height: 30px;
  margin-top: 12px;
}
.lmain-inner .form .form-group .form-title {
  display: inline-block;
  margin-top: 4px;
  width: 84px;
  height: 21px;
  font-size: 14px;
  font-family: MicrosoftYaHei;
  color: #5f6172;
  line-height: 21px;
}
.lmain-inner .form .form-group .input {
  display: inline-block;
  width: 160px;
  height: 30px;
}
.lmain-inner .form .form-group .input input {
    outline: none;
    width: 100%;
    height: 100%;
    font-size: 12px;
    font-family: MicrosoftYaHei;
    color: #787e7e;
    line-height: 30px;
    letter-spacing: 1px;
    text-indent: 0;
    -webkit-text-fill-color: #787e7e;
    padding: 5px 67px 4px 16px;
    border: 1px solid #BDC4C3;
    border-radius: 15px;
}
.lmain-inner .form .form-group .input input:focus {
    border: 1px solid #2e7bff;
}
input[type="text"],
input[type="password"] {
    padding-left: 2px;
}

.input_eye {
    right: 6px;
    top: 0;
}
/* 记住密码/忘记密码 */
.lmain-inner .form .remember {
  margin-left: -1px;
}
.lmain-inner .form .remember img {
  width: 24px;
  height: 24px;
  float: left;
  vertical-align: middle;
}
.forget-form label {
    display: inline-block;
}
.font-pwd {
  font-size: 12px;
  font-family: MicrosoftYaHei;
  color: #787e7e;
  line-height: 24px;
  letter-spacing: 1px;
}
.remember .rem-pwd {
  display: inline-block;
  width: 116px;
  height: 24px;
  vertical-align: middle;
}
.forget .forget-pwd {
  display: inline-block;
  width: 65px;
  height: 24px;
  cursor: pointer;
}
.pwd-tips {
    font-size: 10px;
    font-family: MicrosoftYaHei;
    color: #f03e4f;
    letter-spacing: 0.5px;
    line-height: 24px;
}
#div_visite input[type="button"] {
    margin: 0 auto;
    width: 245px;
    height: 40px;
    background: #2e7bff;
    border-radius: 20px;
    cursor: pointer;
    font-size: 16px;
    font-family: MicrosoftYaHei;
    color: #ffffff;
    line-height: 40px;
    letter-spacing: 2px;
    text-align: center;
}
</style>
