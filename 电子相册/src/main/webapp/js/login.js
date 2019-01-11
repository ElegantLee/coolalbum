"use strict";
! function() {
	"undefined" != typeof window && void 0 !== window.document && window.document;
	var e = "undefined" != typeof module && module.exports,
		s = {
			submitHandler: function(e, r) {
				var i = ["登录成功", "登录成功", "注册成功", "密码重置成功，请重新登录", "手机号绑定成功"],
					o = Util.getQueryString("redirect_url") || "/",
					n = [o, o, o, "/login?type=1", o],
					t = {
						url: ["/share/user/Login", "/share/user/PhoneLogin", "/user/register/register", "/share/user/RetrievePassword",
							"/User/PcThird/ThirdBindPhone"
						][r],
						type: "post",
						data: e
					};
				Util.ajax(t).then(function(e) {
					layer.msg(i[r]), window.location.href = n[r]
				})
			},
			getCode: function(r) {
				var i = ["getLoginCodeBtn", "getRegisterByEmailCodeBtn", "getRegisterByPhoneCodeBtn", "getResetPasswordCodeBtn",
						"getBindRegisterPhoneCodeBtn"
					],
					e = ["/share/user/SendLoginPhoneCode", "/user/register/SendRegisterEmailCode",
						"/user/register/ProtectSendRegisterPhoneCode", "/share/user/SendRetrievePasswordCode",
						"/User/PcThird/SendBindRegisterPhoneCode"
					];
				if ($("#" + i[r]).hasClass("layui-btn-disabled")) return !1;
				var o = $("#" + ["loginPhone", "registerEmail", "registerPhone", "resetPasswordPhone", "bindRegisterPhone"][r]).val();
				if (0 == r || 2 == r) {
					if (!Util.isPhoneNum(o)) return layer.msg("请输入正确的手机号"), !1
				} else if (1 == r) {
					if (!Util.isEmail(o)) return layer.msg("请输入正确的邮箱"), !1
				} else if (3 == r && !Util.isPhoneNum(o) && !Util.isEmail(o)) return layer.msg("请输入正确的手机号码或邮箱"), !1;
				var n = {
					url: e[r],
					data: {
						phone: o
					},
					type: "post"
				};
				1 == r && (n = {
					url: e[r],
					data: {
						email: o
					},
					type: "post"
				}), Util.ajax(n).then(function(e) {
					Util.countDown(i[r]), layer.msg("验证码已发送，请注意查收")
				})
			},
			init: function() {
				layui.use("form", function() {
					var i = layui.form;
					i.verify({
						password: [/^[\S]{6,12}$/, "密码必须6到12位，且不能出现空格"],
						phone: [/^1[0-9]{10}$/, "请输入正确的手机号"],
						code: [/^\d{4}$/, "请输入四位数字验证码"],
						confirmPassword: function(e, r) {
							if ($("#oldPassword").val() !== e) return "两次输入不一致"
						}
					});
					for (var o = ["loginByPasswordForm", "loginByPhoneForm", "registerByEmailForm", "registerByPhoneForm",
							"resetPasswordForm", "bindRegisterPhoneForm"
						], n = [0, 1, 2, 2, 3, 4], e = function(r, e) {
							i.on("submit(" + o[r] + ")", function(e) {
								if ((0 != r && 2 != r && 3 != r && 4 != r || (e.field.password = md5(e.field.password)), 2 == r || 3 == r) &&
									!e.field.is_read) return layer.msg("注册前请先阅读并同意《探图网络服务使用协议》"), !1;
								return 4 == r && (e.field.confirm_password = null), s.submitHandler(e.field, n[r]), !1
							})
						}, r = 0, t = o.length; r < t; r++) e(r)
				})
			}
		};
	s.init(), e ? module.exports = s : window.Login = s
}();
