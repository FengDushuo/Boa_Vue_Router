/* eslint-disable no-unreachable */
/* eslint-disable eqeqeq */
/* eslint-disable no-redeclare */
/* eslint-disable no-unused-vars */
/* eslint-disable camelcase */
/* eslint-disable one-var */
'use strict'
import $ from 'jquery'

const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'

function MyPromise (callback) {
  this.status = PENDING // 储存状态
  this.__succ__res = null // 储存resolve结果
  this.__err__res = null // 储存reject结果
  this.__queue = [] // 事件队列

  var _this = this
  function resolver (res) {
    setTimeout(function () {
      if (_this.status === PENDING) {
        _this.status = FULFILLED
        _this.__succ__res = res
        _this.__queue.forEach(function (item) {
          item.resolve(res)
        })
      };
    }, 0)
  };
  function rejecter (rej) {
    setTimeout(function () {
      if (_this.status === PENDING) {
        _this.status = REJECTED
        _this.__err__res = rej
        _this.__queue.forEach(function (item) {
          item.reject(rej)
        })
      };
    }, 0)
  };
  try {
    callback(resolver, rejecter)
  } catch (err) {
    this.__err__res = err
    this.status = REJECTED
    this.__queue.forEach(function (item) {
      item.reject(err)
    })
  };
};

MyPromise.prototype.then = function (onFulfilled, onRejected) {
  var _this = this
  return new MyPromise(function (resFn, rejFn) {
    if (_this.status === FULFILLED) {
      handleFulfilled(_this.__succ__res)
    } else if (_this.status === REJECTED) {
      handleRejected(_this.__err__res)
    } else { // pending状态
      _this.__queue.push({resolve: handleFulfilled, reject: handleRejected})
    };

    function handleFulfilled (value) {
      var returnVal = value
      // 获取 onFulfilled 函数的返回结果
      if (onFulfilled instanceof Function) {
        try {
          returnVal = onFulfilled(value)
        } catch (err) { // 代码错误处理
          rejFn(err)
          return
        };
      };

      if (returnVal && returnVal['then'] instanceof Function) {
        returnVal.then(function (res) {
          resFn(res)
        }, function (rej) {
          rejFn(rej)
        })
      } else {
        resFn(returnVal)
      };
    };
    function handleRejected (reason) {
      if (onRejected instanceof Function) {
        var returnVal
        try {
          returnVal = onRejected(reason)
        } catch (err) {
          rejFn(err)
          return
        };

        if (typeof returnVal !== 'undefined' && returnVal['then'] instanceof Function) {
          returnVal.then(function (res) {
            resFn(res)
          }, function (rej) {
            rejFn(rej)
          })
        } else {
          resFn(returnVal)
        };
      } else {
        rejFn(reason)
      }
    }
  })
}
MyPromise.resolve = function (arg) {
  if (typeof arg === 'undefined' || arg === null) { // undefined 或者 null
    return new MyPromise(function (resolve) {
      resolve(arg)
    })
  } else if (arg instanceof MyPromise) { // 参数是MyPromise实例
    return arg
  } else if (arg['then'] instanceof Function) { // 参数是thenable对象
    return new MyPromise(function (resolve, reject) {
      arg.then(function (res) {
        resolve(res)
      }, function (rej) {
        reject(rej)
      })
    })
  } else { // 其他值
    return new MyPromise(function (resolve) {
      resolve(arg)
    })
  };
}
MyPromise.reject = function (arg) {
  return new MyPromise(function (resolve, reject) {
    reject(arg)
  })
}
MyPromise.all = function (arr) {
  if (!Array.isArray(arr)) {
    throw new TypeError('参数应该是一个数组!')
  };
  return new MyPromise(function (resolve, reject) {
    var i = 0, result = []
    next()
    function next () {
      // 对于不是MyPromise实例的进行转换
      MyPromise.resolve(arr[i]).then(function (res) {
        result.push(res)
        i++
        if (i === arr.length) {
          resolve(result)
        } else {
          next()
        };
      }, reject)
    }
  })
}
MyPromise.race = function (arr) {
  if (!Array.isArray(arr)) {
    throw new TypeError('参数应该是一个数组!')
  };
  return new MyPromise(function (resolve, reject) {
    var done = false
    arr.forEach(function (item) {
      MyPromise.resolve(item).then(function (res) {
        if (!done) {
          resolve(res)
          done = true
        };
      }, function (rej) {
        if (!done) {
          reject(rej)
          done = true
        };
      })
    })
  })
}

MyPromise.prototype.catch = function (errHandler) {
  return this.then(undefined, errHandler)
}
MyPromise.prototype.finally = function (finalHandler) {
  return this.then(finalHandler, finalHandler)
}

// _speedtest_popup_window('Speed test!', 'please wait...', 30, function(){ console.log('OK'); });
function _speedtest_popup_window (title, description, sec, func) {
  _draw_popup_window(null, null, description, [])
  $('.popup .popup-dialog-top').empty()
  $('.popup .popup-dialog-buttom').addClass('description')
  $('.popup .popup-dialog-content').html('<div class="title"></div>')
  $('.popup .popup-dialog-content .title').text(title)
  $('.popup .popup-dialog-content').append('<br><img src="../img/speedtest.png">')
  $('.popup .popup-dialog-content').append('<div class="progress-bar"><div class="in-progress"></div></div>')
  $('.popup').fadeIn()
  var tmpSec = 0
  var tmpInt = setInterval(function () {
    tmpSec++
    var tmpWidth = tmpSec / Number(sec) * 100
    tmpWidth = (tmpWidth >= 100) ? 100 : tmpWidth
    $('.in-progress', '.popup').css({width: tmpWidth + '%'})
    if (tmpSec === Number(sec)) {
      clearInterval(tmpInt)
      $('.popup').fadeOut(function () {
        $(this).remove()
        if (func) { func() }
      })
    }
  }, 1000)
}
// _progress_popup_window('Progressing!', 'please wait...', 30, function(){ console.log('OK'); });
function _progress_popup_window (title, description, sec, func) {
  _draw_popup_window(null, null, description, [])
  $('.popup .popup-dialog-top').empty()
  $('.popup .popup-dialog-buttom').addClass('description')
  $('.popup .popup-dialog-content').html('<div class="title"></div>')
  $('.popup .popup-dialog-content .title').text(title)
  $('.popup .popup-dialog-content').append('<br><div class="progress-bar"><div class="in-progress"></div></div>')
  $('.popup').fadeIn()
  var tmpSec = 0
  var tmpInt = setInterval(function () {
    tmpSec++
    var tmpWidth = tmpSec / Number(sec) * 100
    tmpWidth = (tmpWidth >= 100) ? 100 : tmpWidth
    $('.in-progress', '.popup').css({width: tmpWidth + '%'})
    if (tmpSec === Number(sec)) {
      clearInterval(tmpInt)
      $('.popup').fadeOut(function () {
        $(this).remove()
        if (func) { func() }
      })
    }
  }, 1000)
}
// _waiting_popup_window('Waiting!', 3, function(){ console.log('OK'); });
function _waiting_popup_window (msg, sec, func) {
  _draw_popup_window(null, null, msg, [])
  $('.popup .popup-dialog-content').html('<img src="../img/loading.gif">')
  $('.popup').fadeIn()
  setTimeout(function () {
    $('.popup').fadeOut(function () {
      $(this).remove()
      if (func) { func() }
    })
  }, Number(sec) * 1000)
}
// _success_popup_window('Upgrade Successful!', 3, function(){ console.log('OK'); });
function _success_popup_window (msg, sec, func) {
  _draw_popup_window(null, null, msg, [])
  $('.popup .popup-dialog-content').html('<img src="../img/success.png">')
  $('.popup').fadeIn()
  setTimeout(function () {
    $('.popup').fadeOut(function () {
      $(this).remove()
      if (func) { func() }
    })
  }, Number(sec) * 1000)
}
// _fail_popup_window('Upgrade Failed!', 3, function(){ console.log('OK'); });
function _fail_popup_window (msg, sec, func) {
  _draw_popup_window(null, null, msg, [])
  $('.popup .popup-dialog-content').html('<img src="../img/fail.png">')
  $('.popup').fadeIn()
  setTimeout(function () {
    $('.popup').fadeOut(function () {
      $(this).remove()
      if (func) { func() }
    })
  }, Number(sec) * 1000)
}
// _confirm_restart_popup_window('Are you sure you want to restart your device?', function(){ console.log('OK'); }, function(){ console.log('Cancel'); });
function _confirm_restart_popup_window (msg, func0, func1) {
  _draw_popup_window(null, msg, null, [{ name: '确定重启', class: 'secondary' }, { name: '取消', class: '' }])
  $('input.input-btn0', '.popup').on('click', function () {
    $('.popup').fadeOut(function () {
      $(this).remove()
      if (func0) { func0() }
    })
  })
  $('input.input-btn1', '.popup').on('click', function () {
    $('.popup').fadeOut(function () {
      $(this).remove()
      if (func1) { func1() }
    })
  })
  $('.popup').fadeIn()
}

function _draw_popup_window (title, msg, buttom, btns, className, img) {
  var html = ''
  html += '<div class="popup" data="" style="display: none;">'
  html += '<div class="popup-dialog alertbox">'
  html += '<div class="popup-dialog-top title">&nbsp;</div>'
  if (img) {
    html += '<div class="popup-dialog-top img"><img src=""></div>'
  }
  html += '<div class="popup-dialog-content">&nbsp;</div>'
  html += '<div class="popup-dialog-buttom">&nbsp;</div>'
  html += '</div>'
  html += '</div>'
  $('body').append(html)

  if (className) {
    $('.popup .popup-dialog').addClass(className)
  }
  if (img) {
    $('.popup .popup-dialog-top.img img').attr('src', img)
  }
  if (title) {
    $('.popup .popup-dialog-top').text(title)
  }
  if (msg) {
    if (msg == '设备名称') {
      var str = '设备名称<input id="hostName" size="10" name="hostName" value="' + buttom + '" style="width: 160px;margin-left: 20px;">'
      $('.popup .popup-dialog-content').html(str)
    } else {
      $('.popup .popup-dialog-content').text(msg)
    }
  }
  if (buttom) {
    $('.popup .popup-dialog-buttom').text(buttom)
    if (msg == '设备名称') {
      for (var key in btns) {
        if (btns[key].name == 'empty') return
        if (Number(key) === 0) { $('.popup .popup-dialog-buttom').empty() }
        $('.popup .popup-dialog-buttom').append('<input data="' + key + '" class="input-small input-btn' + key + ' ' + btns[key].class + '" type="button" value="btn' + key + '">')
        $('input.input-btn' + key, '.popup').val(btns[key].name)
        $('input.input-btn' + key, '.popup').on('click', function () {
          $('.popup').attr('data', 'btn' + $(this).attr('data'))
        })
      }
    }
  } else {
    for (var key in btns) {
      if (btns[key].name == 'empty') return
      if (Number(key) === 0) { $('.popup .popup-dialog-buttom').empty() }
      $('.popup .popup-dialog-buttom').append('<input data="' + key + '" class="input-small input-btn' + key + ' ' + btns[key].class + '" type="button" value="btn' + key + '">')
      $('input.input-btn' + key, '.popup').val(btns[key].name)
      $('input.input-btn' + key, '.popup').on('click', function () {
        $('.popup').attr('data', 'btn' + $(this).attr('data'))
      })
    }
  }
};

window.alert = function () {
  // console.log(arguments);
  // 自定义按钮文字
  if (arguments[1]) {
    // 修改样式
    if (arguments[2]) {
      // 添加图片
      if (arguments[3]) {
        _draw_popup_window(null, arguments[0], null, [{ name: arguments[1], class: '' }], arguments[2], arguments[3])
      } else {
        _draw_popup_window(null, arguments[0], null, [{ name: arguments[1], class: '' }], arguments[2])
      }
    } else {
      _draw_popup_window(null, arguments[0], null, [{ name: arguments[1], class: '' }])
    }
  } else {
    _draw_popup_window(null, arguments[0], null, [{ name: '确定', class: '' }])
  }
  $('.popup').fadeIn()
  var ret = false
  new MyPromise(function (resolve) {
    var interval = setInterval(function () {
      var tmpData = $('.popup').attr('data')
      if (tmpData !== '') {
        // console.log('interval');
        $('.popup').fadeOut(function () {
          $(this).remove()
        })
        clearInterval(interval)
        resolve(true)
      }
    }, 100)
  }).then(arguments[1])
}

window.confirm = function () {
  // console.log(arguments);
  if (arguments[0] == '设备名称') {
    _draw_popup_window(null, arguments[0], arguments[1], [{ name: '确定', class: 'secondary' }, { name: '取消', class: '' }])
    $('.popup').fadeIn()
    var ret = false
    new MyPromise(function (resolve) {
      var interval = setInterval(function () {
        var tmpData = $('.popup').attr('data')
        if (tmpData !== '') {
          // console.log('interval');
          $('.popup').fadeOut(function () {
            $(this).remove()
          })
          clearInterval(interval)
          if (tmpData === 'btn0') {
            resolve(true)
          }
          if (tmpData === 'btn1') {
            resolve(false)
          }
        }
      }, 100)
    }).then(arguments[2])
  } else {
    _draw_popup_window(null, arguments[0], null, [{ name: '确定', class: 'secondary' }, { name: '取消', class: '' }])
    $('.popup').fadeIn()
    var ret = false
    new MyPromise(function (resolve) {
      var interval = setInterval(function () {
        var tmpData = $('.popup').attr('data')
        if (tmpData !== '') {
          // console.log('interval');
          $('.popup').fadeOut(function () {
            $(this).remove()
          })
          clearInterval(interval)
          if (tmpData === 'btn0') {
            resolve(true)
          }
          if (tmpData === 'btn1') {
            resolve(false)
          }
        }
      }, 100)
    }).then(arguments[1])
  }
}

var wait_timer = null
// 页面倒计时
function showLoading (delay, classname, msg) {
  var wait_time = delay || 3
  var wait_msg = msg ? (msg + wait_time + 's') : ('正在保存您的配置，请耐心等待…' + wait_time + 's')
  alert(wait_msg, 'empty', 'upgrade ' + classname, '../img/loading.png')

  wait_timer = setInterval(function () {
    if (wait_time >= 0) {
      wait_time--
      wait_msg = msg ? (msg + wait_time + 's') : ('正在保存您的配置，请耐心等待…' + wait_time + 's')
      $('.' + classname + ' .popup-dialog-content').text(wait_msg)
      if (wait_time == 0) {
        hideLoading(classname)
        location.reload()
      }
    }
  }, 1000)
}

function hideLoading (classname) {
  clearInterval(wait_timer)
  wait_timer = null
  $('.' + classname).css('display', 'none')
}
