cordova-plugin-ionic-avos
=========================
基于avos和ionic的app 第三方登陆插件

#Install

```bash
ionic plugin add https://github.com/sankooc/cordova-plugin-ionic-avos.git
```

# How to use
```javascript
var loginHandle =function(userdata){
  //todo
}
var errorHandle = function(err){
  //todo
}
var authdata = {
  AppKey:'appkey',
  AppSecret:"secret",
  RedirectURI:"redirect"
}
avosnic.login(loginHandle,errorHandle,'weibo',authdata);
```
