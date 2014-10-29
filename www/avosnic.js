var exec = require('cordova/exec')

var Avosnic = function () {
    this.name = "avosnic";
};

Avosnic.prototype.login = function (succ,error,type,option) {
  type = type || 'weibo'
  switch(type){
    case 'weibo':
      return  exec(succ, error, "Avosnic", "weiboLogin",[option]);
    case 'tencent':
      return exec(succ, error, "Avosnic", "tencentLogin",[option]);
  }
};

module.exports = new Avosnic();
