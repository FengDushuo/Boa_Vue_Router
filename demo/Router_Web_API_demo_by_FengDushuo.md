---
title: Router_Web v1.0.0
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.15"

---

# Router_Web

> v1.0.0

# Default

## GET 读取路由器当前web参数

GET /cgi-bin/config_get.cgi

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|contentframe|query|string| 是 |页面名称|

> 返回示例

> 成功

```json
{
  "code": 200,
  "status": "SUCCESS",
  "WebCustom_Entry": {
    "isCTFJSupported": 0,
    "isCTPONYNSupported": 0,
    "isCT2PORTSSupported": 0,
    "isWLanSupported": 0,
    "isCT1PORTSupported": 0,
    "isCYE8SFUSupported": 0
  },
  "WanInfo_Common": {
    "CycleNum": 1,
    "CycleValue": 2,
    "ConnectionError": 0,
    "APOn": 1
  },
  "WLan11ac_Common": {
    "APOn": 0
  },
  "XPON_LinkCfg": {
    "LinkSta": "uuuu"
  },
  "XPON_Common": {
    "trafficStatus": "jjj"
  },
  "Info_PonPhy": {
    "FecStatus": 0,
    "TxPower": 7,
    "RxPower": 8
  },
  "Info_PonWanStats": {
    "TxFrameCnt": 1
  },
  "System_Entry": {
    "reboot_type": 1
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» status|string|true|none||none|
|» WebCustom_Entry|object|true|none||none|
|»» isCTFJSupported|integer|true|none||none|
|»» isCTPONYNSupported|integer|true|none||none|
|»» isCT2PORTSSupported|integer|true|none||none|
|»» isWLanSupported|integer|true|none||none|
|»» isCT1PORTSupported|integer|true|none||none|
|»» isCYE8SFUSupported|integer|true|none||none|
|» WanInfo_Common|object|true|none||none|
|»» CycleNum|integer|true|none||none|
|»» CycleValue|integer|true|none||none|
|»» ConnectionError|integer|true|none||none|
|»» APOn|integer|true|none||none|
|» WLan11ac_Common|object|true|none||none|
|»» APOn|integer|true|none||none|
|» XPON_LinkCfg|object|true|none||none|
|»» LinkSta|string|true|none||none|
|» XPON_Common|object|true|none||none|
|»» trafficStatus|string|true|none||none|
|» Info_PonPhy|object|true|none||none|
|»» FecStatus|integer|true|none||none|
|»» TxPower|integer|true|none||none|
|»» RxPower|integer|true|none||none|
|» Info_PonWanStats|object|true|none||none|
|»» TxFrameCnt|integer|true|none||none|
|» System_Entry|object|true|none||none|
|»» reboot_type|integer|true|none||none|

# 数据模型

