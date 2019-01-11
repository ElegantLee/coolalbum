"use strict";
! function() {
	var p = "undefined" != typeof window && void 0 !== window.document ? window.document : {},
		t = "undefined" != typeof module && module.exports,
		r = {
			externalLinks: function() {
				layer.open({
					type: 1,
					area: ["600px", "360px"],
					shadeClose: !0,
					title: "交换友情链接提示",
					content: '<div class="t-p5">\n      <p class="t-rose">友情链接</p>\n      <p class="t-rose">如果您想与探图网交换链接，请先在贵网站首页添加 www.tantupix.com 的文字链接后联系我们。 </p>\n      <p class="t-mt5">链接要求：媒体、数码、文化艺术类网站。</p>\n      <p class="t-mt5">合作/链接联系</p>\n      <p>Email: <a href="mailto:bingof@tantupix.com" target="_blank" rel="nofollow noopener noreferrer" class="t-rose">bingof@tantupix.com</a></p>\n      <p class="t-mt5">网址: <span class="t-rose">https://www.tantupix.com</span></p>\n      <p>文字链接: <span class="t-rose">探图网</span></p>\n      </div>'
				})
			},
			baiduStatistics: function() {
				if (-1 < window.location.host.indexOf("www.tantupix.com")) {
					! function() {
						var t = p.createElement("script");
						t.src = "https://hm.baidu.com/hm.js?6ac94ee1153dc770b0324e6b0ca06cb3";
						var a = p.createElement("script");
						a.src = "https://hm.baidu.com/hm.js?9c6fa246480dcda1ebf8ed3a45eed015";
						var e = p.createElement("script"),
							i = window.location.protocol.split(":")[0];
						e.src = "https" == i ? "https://zz.bdstatic.com/linksubmit/push.js" : "http://push.zhanzhang.baidu.com/push.js";
						var n = p.getElementsByTagName("script")[0];
						n.parentNode.insertBefore(t, n), n.parentNode.insertBefore(a, n), n.parentNode.insertBefore(e, n);
						var o, r, s, l, c, d, u = "http:" == p.location.protocol ?
							"http://js.passport.qihucdn.com/11.0.1.js?c5c49845d74a8a58107181d14f741000" :
							"https://jspassport.ssl.qhimg.com/11.0.1.js?c5c49845d74a8a58107181d14f741000";
						p.write('<script src="' + u + '" id="sozz"><\/script>'), o = window, r = p, s = "script", l = "ga", o.GoogleAnalyticsObject =
							l, o.ga = o.ga || function() {
								(o.ga.q = o.ga.q || []).push(arguments)
							}, o.ga.l = 1 * new Date, c = r.createElement(s), d = r.getElementsByTagName(s)[0], c.async = 1, c.src =
							"https://www.google-analytics.com/analytics.js", d.parentNode.insertBefore(c, d), ga("create", "UA-121195476-1",
								"auto"), ga("send", "pageview")
					}()
				}
			},
			scrollToTop: function() {
				$(".js_back_top").hide(), $(window).scroll(function() {
					setTimeout(function() {
						500 < Util.getScrollTop() ? $(".js_back_top").show() : $(".js_back_top").hide()
					}, 300)
				}), $(".js_back_top").off("click"), $(".js_back_top").on("click", function() {
					Util.scrollTo(0, 200)
				})
			},
			setFontSize: function() {
				window.innerHeight;
				var t = window.innerWidth * (100 / 1920);
				$("html").css("font-size", t + "px")
			},
			isLogin: function() {
				var t = $("#cur_login_user_id").val();
				return !Util.isEmpty(t) || (layer.msg("请先登录！"), !1)
			},
			shareDialog: function(t) {
				var a = (t = t || {}).url || window.location.href.split("?")[0],
					e = Util.addURLParam(a, "share_from", "web"),
					i = t.title.substring(0, 35) || "探图网，一个可售卖的高品质摄影社区",
					n = t.desc.substring(0, 35) || "探图网，一个可售卖的高品质摄影社区",
					o = t.image || "https://static.tantupix.com/pc/images/default_avatar.jpg",
					r = {
						qq: "http://connect.qq.com/widget/shareqq/index.html?url=" + e + "&title=" + i + "&source={{SOURCE}}&desc=" + n +
							"&pics=" + o,
						weibo: "http://service.weibo.com/share/share.php?url=" + e + "&title=" + i + "&pic=" + o +
							"&appkey={{WEIBOKEY}}",
						douban: "http://shuo.douban.com/!service/share?href=" + e + "&name=" + i + "&text=" + n + "&image=" + o +
							"&starid=0&aid=0&style=11",
						renren: "http://widget.renren.com/dialog/share?resourceUrl=" + e + "&title=" + i + "&message=" + n +
							"&description=" + n + "&pic=" + o
					},
					s = "";
				for (var l in r) {
					s += '<a data-type="' + l + '" href="' + r[l] +
						'" target="_blank" rel="noopear noreferrer"><i class="icon-share icon-share-' + l + '"></i></a>'
				}
				var c =
					'<div class="t-m5 t-p5 t-align-center">\n        <a href="javascript:void(0);" onclick="Global.shareToWeChat(\'' +
					e + '\')"><i class="icon-share icon-share-wechat"></i></a>\n        ' + s + "\n      </div>";
				layer.open({
					type: 1,
					area: ["500px"],
					resize: !1,
					shadeClose: !0,
					title: "分享",
					content: c
				})
			},
			shareToWeChat: function(t) {
				layer.open({
					type: 1,
					resize: !1,
					shadeClose: !0,
					title: "微信扫码分享",
					content: '<div id="shareQrcode" class="t-p2"></div>'
				}), $("#shareQrcode").qrcode({
					width: 180,
					height: 180,
					text: t
				})
			},
			setHeaderTransparent: function(t) {
				t = t || ".js_header", 80 < Util.getScrollTop() ? $(t).hasClass("transparent") && $(t).removeClass("transparent") :
					$(t).hasClass("transparent") || $(t).addClass("transparent")
			},
			pinned: function(t, a) {
				var e = Util.getScrollTop();
				$(t).offset().top - e < 50 ? $(a).hasClass("fixed") || $(a).addClass("fixed") : $(a).hasClass("fixed") && $(a).removeClass(
					"fixed")
			},
			logout: function() {
				Util.ajax({
					url: "/share/user/Logout"
				}).then(function(t) {
					window.location.href = "/login"
				})
			},
			searchEnter: function() {
				var t = $("#search_kw").val(),
					a = window.location.href,
					e = "products";
				e = -1 < a.indexOf("photographers") ? "photographers" : -1 < a.indexOf("articles") ? "articles" : -1 < a.indexOf(
						"market") ? "market" : "products", Util.isEmpty(t) ? layer.msg("请输入你要搜索的内容") : window.location.href =
					"/search?type=" + e + "&kw=" + t
			},
			emptyStateTips: function(t, a) {
				var e = '<div class="empty-status-box">\n        <i class="icon-empty-state"></i>\n        <p class="tips">' + (a =
					a || "暂无数据") + "</p>\n      </div>";
				p.getElementById(t).innerHTML = e
			},
			selectAllCheckbox: function(i, t) {
				i = i || "checkbox", t = t || "checkboxAll", layui.use("form", function() {
					var e = layui.form;
					e.on("checkbox(" + t + ")", function(t) {
						if (t.elem.checked) {
							$('input[name="' + i + '"]').prop("checked", !0), $('input[name="' + i + '"][disabled="disabled"]').prop(
								"checked", !1), e.render("checkbox");
							var a = $('input[name="' + i + '"]:checked');
							$(".js_checked_count").html(a.length)
						} else $('input[name="' + i + '"]').prop("checked", !1), e.render("checkbox"), $(".js_checked_count").html(0)
					})
				})
			},
			selectOneCheckbox: function(t, a, s) {
				t = t || "checkbox", a = a || "checkboxOne", s = s || "checkboxAll", layui.use("form", function() {
					var r = layui.form;
					r.on("checkbox(" + a + ")", function(t) {
						for (var a = $('input[name="checkbox"]'), e = a.length, i = $('input[name="checkbox"]:checked'), n = i.length,
								o = 0; o < e; o++) 0 == a[o].checked && ($('input[name="' + s + '"]').prop("checked", !1), r.render(
							"checkbox"));
						n == e && ($('input[name="' + s + '"]').prop("checked", !0), r.render("checkbox")), $(".js_checked_count").html(
							i.length)
					})
				})
			},
			getCheckedIds: function(t) {
				t = t || "checkbox";
				for (var a = p.getElementsByName(t), e = a.length, i = [], n = 0; n < e; n++) {
					var o = a[n];
					o.checked && i.push(parseInt(o.value))
				}
				return i
			},
			countChecked: function(t, a) {
				t = t || "checkbox", a = a || "checkboxAll";
				var e = $('input[name="' + t + '"]:checked').length,
					i = $('input[name="' + t + '"]').length;
				$(".js_checked_count").html(e), layui.use("form", function() {
					var t = layui.form;
					e == i && 0 != i ? $('input[name="' + a + '"]').prop("checked", !0) : $('input[name="' + a + '"]').prop(
						"checked", !1), t.render("checkbox")
				})
			},
			addCart: function(t) {
				if (!r.isLogin()) return !1;
				var a = {
					url: "/Share/Cart/AddCart",
					data: {
						product_id: t
					}
				};
				Util.ajax(a).then(function(t) {
					var a = $(".js_cart_count").html();
					a = "" == a ? 1 : parseInt(a) + 1, $(".js_cart_count").html(a), layer.confirm("已加入购物车", {
						icon: 1,
						title: "操作结果",
						btn: ["去结算", "再逛逛"]
					}, function(t) {
						window.location.href = "/cart?step=1"
					})
				})
			},
			flexImagesItem: function(t, a) {
				var e = (a = a || {}).ajaxObj || {},
					i = a.isShowTopOver || !1,
					n = {
						query_type: e.url || "",
						query_params: Util.stringfyQueryString(e.data) || ""
					};
				n = "?" + Util.stringfyQueryString(n);
				this.setImgAlt(t);
				var o = t.sale_info,
					r = "";
				o && 3 == o.status && (r =
					'<span class="product-info-item js_icon_cart_box" title="点击加入购物车" onclick="Global.addCart(' + t.id +
					')">\n          <i class="icon icon-cart" data-id="' + t.id + '"></i>\n        </span>');
				var s = "";
				i && (s =
					'<div class="layui-form top-over opacity">\n          <span class="top-over-item"><input type="checkbox" name="checkbox" value="' +
					t.id + '" lay-filter="checkboxOne" lay-skin="primary" data-id="' + t.id +
					'"/></span>\n          <span class="top-over-item setting js_set_cover" data-id="' + t.id +
					'">设为封面</span>\n        </div>');
				t.id, t.id, t.id, t.statistic.favs, t.id, t.id, t.statistic.visits;
				return '<div class="flex-images-item item" data-id="' + t.id + '" data-w="' + (t.width || 1024) + '" data-h="' + (
						t.height || 1024) + '">\n        ' + s + '\n        <a href="/products/' + t.id + n +
					'" target="_blank" rel="noreferrer noopener" class="default-thumb">\n          <span class="thumb lazy-img" style="background: url(\'\') center center/cover no-repeat;" data-src="' +
					t.thumbkey + '-h500"></span>\n        </a>\n        <div class="over">\n          <a href="/photographers/' + t.user
					.id +
					'/product" target="_blank" rel="noreferrer noopener">\n            <span class="user-avatar" style="background: url(https://static.tantupix.com/pc/images/default_avatar.jpg) center center/cover no-repeat;">\n              <span class="user-avatar lazy-img" style="background: url(https://static.tantupix.com/pc/images/default_avatar.jpg) center center/cover no-repeat;" data-src="' +
					t.user.avatar + '"></span>\n            </span>\n            <span class="user-nickname">' + t.user.nickname +
					'</span>\n          </a>\n          <div class="product-info">\n            <span class="product-info-item t-cursor js_icon_likes_box" data-id="' +
					t.id + '" title="点赞">\n              <i class="icon icon-likes js_icon_likes" data-id="' + t.id +
					'"></i>\n              <span class="count js_likes_count" data-id="' + t.id + '">' + t.statistic.likes +
					'</span>\n            </span>\n            <a href="/products/' + t.id + n +
					'" target="_blank" rel="noreferrer noopener" class="product-info-item t-cursor" data-id="' + t.id +
					'" title="评论">\n              <i class="icon icon-comment" data-id="' + t.id +
					'" style="margin-top: -3px;"></i>\n              <span class="count" data-id="' + t.id + '">' + t.statistic.comments +
					"</span>\n            </a>\n            " + r + "\n          </div>\n        </div>\n      </div>"
			},
			setImgAlt: function(t) {
				var a = t.ai_tags || [],
					e = t.tag || [],
					i = [],
					n = t.name;
				(0 != e.length && e.forEach(function(t) {
					var a = t.name;
					i.push(a)
				}), 0 != a.length) && a.sort(Util.dataSortBy("tag_confidence")).forEach(function(t) {
					var a = t.tag_confidence,
						e = t.tag_name;
					20 < a && i.push(e)
				});
				return 0 != i.length && (n = n + "," + i.slice(0, 6).toString()), n
			},
			flexImages: function(t) {
				var a = {
					rowHeight: (t = t || {}).rowHeight || 400,
					object: t.object || "",
					truncate: t.truncate || !1
				};
				$(".flex-images").flexImages(a)
			},
			isLikeAndFav: function(t) {
				var a = {
					url: "/share/product/IsLikeAndFav",
					type: "post",
					data: {
						product_ids: t
					}
				};
				Util.ajax(a).then(function(t) {
					for (var a in t) {
						var e = t[a].is_like,
							i = t[a].is_fav,
							n = a;
						0 == e ? ($('.js_icon_likes[data-id="' + n + '"]').removeClass("active"), $('.js_icon_likes_box[data-id="' + n +
								'"]').attr("data-type", 1)) : ($('.js_icon_likes[data-id="' + n + '"]').addClass("active"), $(
								'.js_icon_likes_box[data-id="' + n + '"]').attr("data-type", 0)),
							function(t) {
								$('.js_icon_likes_box[data-id="' + t + '"]').off("click"), $('.js_icon_likes_box[data-id="' + t + '"]').on(
									"click",
									function() {
										r.isLogin() ? r.changeLikeOne(t) : screenfull.isFullscreen && (screenfull.exit(), $(
											".screenfull-container").attr("style", "top: 100%; opacity: 0;"))
									})
							}(a), 0 == i ? ($('.js_icon_favorite[data-id="' + n + '"]').removeClass("active"), $(
								'.js_icon_favorite_box[data-id="' + n + '"]').attr("data-type", 1)) : ($('.js_icon_favorite[data-id="' + n +
								'"]').addClass("active"), $('.js_icon_favorite_box[data-id="' + n + '"]').attr("data-type", 0)),
							function(a) {
								$('.js_icon_favorite_box[data-id="' + a + '"]').off("click"), $('.js_icon_favorite_box[data-id="' + a + '"]')
									.on("click", function() {
										if (0 == parseInt($(this).attr("data-type"))) {
											var t = [a];
											r.cancelFavorite(t)
										} else r.getFavoriteListDialog(a)
									})
							}(a)
					}
				}).catch(function(t) {
					console.log(t)
				})
			},
			changeLikeOne: function(n) {
				if (!r.isLogin()) return !1;
				var o = {
					url: "/share/product/ChangeLikeOne",
					type: "post",
					data: {
						product_id: n,
						type: $('.js_icon_likes_box[data-id="' + n + '"]').attr("data-type")
					}
				};
				Util.ajax(o).then(function(t) {
					var a = parseInt(o.data.type);
					layer.msg(["已取消点赞", "点赞成功"][a]);
					var e = parseInt($('.js_likes_count[data-id="' + n + '"]').html()),
						i = 0 == a ? parseInt(e - 1) : parseInt(e + 1);
					$('.js_likes_count[data-id="' + n + '"]').html(i), 0 == a ? ($('.js_icon_likes[data-id="' + n + '"]').removeClass(
						"active"), $('.js_icon_likes_box[data-id="' + n + '"]').attr("data-type", 1)) : ($('.js_icon_likes[data-id="' +
						n + '"]').addClass("active"), $('.js_icon_likes_box[data-id="' + n + '"]').attr("data-type", 0))
				}).catch(function(t) {
					console.log(t)
				})
			},
			addFolder: function(e, i) {
				if (!r.isLogin()) return !1;
				layer.open({
					type: 1,
					title: "新建专辑",
					shadeClose: !1,
					shade: [.8],
					area: ["356px"],
					maxmin: !1,
					content: '<form class="layui-form t-align-center">\n        <div class="layui-input-inline" style="padding: 80px 20px 100px 20px;">\n          <input type="text" name="name" id="folder_name" required lay-verify="required" lay-verType="tips" lay-filter="name" placeholder="请输入专辑名称" autocomplete="off" class="layui-input t-left" style="width: 200px;margin-right: 10px;">\n          <button class="layui-btn t-bg-rose" lay-submit lay-filter="createFolderForm">新建专辑</button>\n          </div>\n        </form>'
				});
				var n = layer.index;
				layui.use("form", function() {
					layui.form.on("submit(createFolderForm)", function(t) {
						var a = {
							url: "/share/folder/postCreate",
							type: "post",
							data: {
								name: Util.trim(t.field.name, "g")
							}
						};
						return Util.ajax(a).then(function(t) {
							layer.msg("新建成功"), layer.close(n), $("#folder_name").val(""), setTimeout(function() {
								i && i(e)
							}, 200)
						}), !1
					})
				})
			},
			addFavorite: function(e, i) {
				if (!r.isLogin()) return !1;
				layer.open({
					type: 1,
					title: "新建收藏夹",
					shadeClose: !1,
					shade: [.8],
					area: ["356px"],
					maxmin: !1,
					content: '<form class="layui-form t-align-center">\n        <div class="layui-input-inline" style="padding: 80px 20px 100px 20px;">\n          <input type="text" name="name" id="favorite_name" required lay-verify="required" lay-verType="tips" lay-filter="name" placeholder="请输入收藏夹名称" autocomplete="off" class="layui-input t-left" style="width: 200px;margin-right: 10px;">\n          <button class="layui-btn t-bg-rose" lay-submit lay-filter="createFavoriteForm">新建收藏夹</button>\n        </div>\n      </form>'
				});
				var n = layer.index;
				layui.use("form", function() {
					layui.form.on("submit(createFavoriteForm)", function(t) {
						var a = {
							url: "/share/favorite/Create",
							type: "post",
							data: {
								name: Util.trim(t.field.name, "g")
							}
						};
						return Util.ajax(a).then(function(t) {
							layer.msg("新建成功"), layer.close(n), $("#favorite_name").val(""), i && i(e)
						}), !1
					})
				})
			},
			getFolderList: function() {
				if (!r.isLogin()) return !1;
				var t = {
					url: "/share/folder/getLists",
					data: {
						user_id: $("#cur_login_user_id").val()
					}
				};
				Util.ajax(t).then(function(t) {
					var a = "",
						e = t.list;
					if (0 == e.length) a =
						'<div class="empty-status-box">\n            <i class="icon-empty-state"></i>\n            <p class="tips">暂无专辑！</p>\n          </div>';
					else {
						for (var i = "checked", n = 0, o = e.length; n < o; n++) 0 !== n && (i = ""), a +=
							'<div class="layui-col-lg6 layui-col-md6 layui-col-sm6 layui-col-xs6"><input type="radio" name="folder_id" value="' +
							e[n].id + '" title="' + e[n].name + '" ' + i + "></div>";
						$("#folder_list").html(a), layui.use("form", function() {
							layui.form.render()
						})
					}
				})
			},
			getFavoriteList: function() {
				if (!r.isLogin()) return !1;
				var t = {
					url: "/share/favorite/Lists",
					data: {
						user_id: $("#cur_login_user_id").val()
					}
				};
				Util.ajax(t).then(function(t) {
					var a = "",
						e = t.list;
					if (0 == e.length) a =
						'<div class="empty-status-box">\n            <i class="icon-empty-state"></i>\n            <p class="tips">暂无收藏夹！</p>\n          </div>';
					else {
						for (var i = "checked", n = 0, o = e.length; n < o; n++) 0 !== n && (i = ""), a +=
							'<div class="layui-col-lg6 layui-col-md6 layui-col-sm6 layui-col-xs6"><input type="radio" name="favorite_id" value="' +
							e[n].id + '" title="' + e[n].name + '" ' + i + "></div>";
						$("#favorite_list").html(a), layui.use("form", function() {
							layui.form.render()
						})
					}
				})
			},
			getFavoriteListDialog: function(o) {
				if (!r.isLogin()) return !1;
				var t =
					'<form class="layui-form" action="">\n        <div class="layui-form-item t-p5" style="min-height: 250px;">\n          <div class="layui-row" id="favorite_list"></div>\n        </div>\n        <div class="layui-form-item t-align-center">\n          <button class="layui-btn t-bg-rose" lay-submit lay-filter="favoriteToForm">确定收藏</button>\n          <span class="layui-btn layui-btn-primary" onclick="Global.addFavorite(' +
					o + ',Global.getFavoriteList)">新增收藏夹</span>\n        </div>\n      </form>';
				layui.use("layer", function() {
					var i = layui.layer;
					i.open({
						type: 1,
						title: "收藏图片",
						shadeClose: !1,
						shade: [.8],
						area: ["356px"],
						maxmin: !1,
						content: t
					}), r.getFavoriteList();
					var n = i.index;
					layui.use("form", function() {
						var t = layui.form;
						t.render(), t.on("submit(favoriteToForm)", function(t) {
							var a = {
								url: "/share/favorite/FavoriteTo",
								data: {
									product_id: o,
									favorite_id: t.field.favorite_id
								}
							};
							return Util.ajax(a).then(function(t) {
								i.msg("收藏成功");
								var a = parseInt($('.js_favorite_count[data-id="' + o + '"]').html());
								$('.js_favorite_count[data-id="' + o + '"]').html(parseInt(a + 1));
								var e = [o];
								r.isLikeAndFav(e), i.close(n)
							}), !1
						})
					})
				})
			},
			favoriteTo: function(i, n) {
				layui.use("form", function() {
					var t = layui.form;
					t.render(), t.on("submit(favoriteToForm)", function(t) {
						var a = {
							url: "/share/favorite/FavoriteTo",
							data: {
								product_id: i,
								favorite_id: t.field.favorite_id
							}
						};
						return util.ajax(a).done(function(t) {
							layer.msg("收藏成功");
							var a = parseInt($('.js_favorite_count[data-id="' + i + '"]').html());
							$('.js_favorite_count[data-id="' + i + '"]').html(parseInt(a + 1));
							var e = [i];
							r.isLikeAndFav(e), layer.close(n)
						}), !1
					})
				})
			},
			cancelFavorite: function(n) {
				var t = {
					url: "/share/favorite/DelProduct",
					data: {
						product_ids: n
					}
				};
				Util.ajax(t).then(function(t) {
					layer.msg("取消收藏成功");
					for (var a = 0, e = n.length; a < e; a++) {
						var i = parseInt($('.js_favorite_count[data-id="' + n[a] + '"]').html());
						$('.js_favorite_count[data-id="' + n[a] + '"]').html(parseInt(i - 1))
					}
					r.isLikeAndFav(n)
				})
			},
			photographerItem: function(t) {
				return '<div class="layui-col-lg3 layui-col-md3 layui-col-sm4 layui-col-xs12">\n        <div class="photographer-item">\n          <div class="photographer-item-bd">\n            <a href="/photographers/' +
					t.id +
					'/product" target="_blank" rel="noreferrer noopener">\n              <span class="photographer-item-avatar" style="background: url(https://static.tantupix.com/pc/images/default_avatar.jpg) center center/cover no-repeat;">\n                <span class="photographer-item-avatar inner lazy-img" style="background: url(\'\') center center/cover no-repeat;" data-src="' +
					t.avatar + '"></span>\n              </span>\n              <h2 class="nickname">' + t.nickname +
					'</h2>\n            </a>\n            <div class="statistic">\n              <span class="t-mr2">作品 ' + t.statistic
					.products + '</span>\n              <span class="t-mr2">人气 ' + t.statistic.popular +
					"</span>\n              <span>粉丝 " + t.statistic.fans +
					'</span>\n            </div>\n            <a class="default-thumb" href="/photographers/' + t.id +
					'/product" target="_blank" rel="noreferrer noopener">\n              <div class="photographer-item-cover" style="background: url(\'https://static.tantupix.com/static/banner/ub1920x436.jpg-min400x300\') center center/cover no-repeat;">\n                <div class="photographer-item-cover lazy-img" style="background: url(\'\') center center/cover no-repeat;" data-src="' +
					t.zoneimg +
					'-min400x300"></div>\n              </div>\n            </a>\n            <span class="t-mt3 follow-btn js_follow_btn" data-id="' +
					t.id + '">关 注</span>\n          </div>\n        </div>\n      </div>'
			},
			isFans: function(t) {
				var a = {
					url: "/share/user/IsFans",
					type: "post",
					data: {
						user_ids: t
					}
				};
				Util.ajax(a).then(function(t) {
					for (var a in t) {
						var e = a,
							i = t[a];
						0 == i ? ($('.js_follow_btn[data-id="' + e + '"]').removeClass("followed"), $('.js_follow_btn[data-id="' + e +
								'"]').html("关 注"), $('.js_follow_btn[data-id="' + e + '"]').attr("data-type", 1)) : 1 == i && ($(
								'.js_follow_btn[data-id="' + e + '"]').addClass("followed"), $('.js_follow_btn[data-id="' + e + '"]').html(
								"已关注"), $('.js_follow_btn[data-id="' + e + '"]').attr("data-type", 0)),
							function(t) {
								$('.js_follow_btn[data-id="' + t + '"]').off("click"), $('.js_follow_btn[data-id="' + t + '"]').on("click",
									function() {
										r.changeFanStatus(t)
									})
							}(a)
					}
				}).catch(function(t) {
					console.log(t)
				})
			},
			changeFanStatus: function(e) {
				if (!r.isLogin()) return !1;
				var i = {
					url: "/share/user/ChangeFanStatus",
					data: {
						user_id: e,
						type: $('.js_follow_btn[data-id="' + e + '"]').attr("data-type")
					}
				};
				Util.ajax(i).then(function(t) {
					var a = i.data.type;
					layer.msg(["已取消关注", "关注成功"][a]), 0 == a ? ($('.js_follow_btn[data-id="' + e + '"]').removeClass("followed"), $(
						'.js_follow_btn[data-id="' + e + '"]').html("关 注"), $('.js_follow_btn[data-id="' + e + '"]').attr(
						"data-type", 1)) : 1 == a && ($('.js_follow_btn[data-id="' + e + '"]').addClass("followed"), $(
						'.js_follow_btn[data-id="' + e + '"]').html("已关注"), $('.js_follow_btn[data-id="' + e + '"]').attr(
						"data-type", 0))
				}).catch(function(t) {
					console.log(t)
				})
			},
			feedback: function() {
				layer.open({
					type: 1,
					title: "意见反馈",
					shadeClose: !1,
					shade: [.8],
					area: ["356px"],
					maxmin: !1,
					scrollbar: !1,
					content: '<form class="layui-form" style="padding: 15px 0;">\n        <div class="padding20 padding-b0">\n          <div class="layui-form-item">\n            <label class="layui-form-label">QQ号</label>\n            <div class="layui-input-inline">\n              <input type="text" name="qq" required lay-verify="required" lay-verType="tips" placeholder="QQ号" autocomplete="off" class="layui-input">\n            </div>\n          </div>\n          <div class="layui-form-item">\n            <label class="layui-form-label">手机号</label>\n            <div class="layui-input-inline">\n              <input type="text" name="phone" required lay-verify="phone" lay-verType="tips" placeholder="手机号" autocomplete="off" class="layui-input">\n            </div>\n          </div>\n          <div class="layui-form-item layui-form-text">\n            <label class="layui-form-label">反馈意见</label>\n            <div class="layui-input-inline">\n              <textarea name="content" required lay-verify="required" lay-verType="tips" placeholder="请在此补充填写您的反馈意见" class="layui-textarea" style="width: 190px;"></textarea>\n            </div>\n          </div>\n        </div>\n        <hr>\n        <div class="layui-form-item t-align-center" style="margin-bottom: 0;padding-top: 15px;">\n          <button class="layui-btn t-bg-rose" lay-submit lay-filter="feedbackForm">立即提交</button>\n        </div>\n      </form>'
				});
				var e = layer.index;
				layui.use("form", function() {
					layui.form.on("submit(feedbackForm)", function(t) {
						var a = {
							url: "/share/user/Feedback",
							type: "post",
							data: t.field
						};
						return Util.ajax(a).then(function(t) {
							layer.msg("提交成功！感谢您的宝贵意见！"), layer.close(e)
						}), !1
					})
				})
			},
			deFriend: function(e) {
				layer.confirm("拉入黑名单后，对方将不能关注你、向你发送私信、评论你的作品和图文、回复你的评论，但仍然可以搜索到你的个人主页。你可以在个人中心的“黑名单管理”模块解除拉黑！", {
					icon: 3,
					title: "操作确认"
				}, function(a) {
					var t = {
						url: "/share/user/defriend",
						type: "post",
						data: {
							black_user_id: e,
							disable_action: "all"
						}
					};
					Util.ajax(t).then(function(t) {
						layer.close(a), layer.msg("拉黑成功")
					})
				}, function(t) {
					layer.close(t)
				})
			},
			init: function() {
				"https" == p.location.protocol && "serviceWorker" in navigator && navigator.serviceWorker.getRegistrations().then(
					function(t) {
						var a = !0,
							e = !1,
							i = void 0;
						try {
							for (var n, o = t[Symbol.iterator](); !(a = (n = o.next()).done); a = !0) {
								n.value.unregister()
							}
						} catch (t) {
							e = !0, i = t
						} finally {
							try {
								!a && o.return && o.return()
							} finally {
								if (e) throw i
							}
						}
					}), window.addEventListener("scroll", function() {
					setTimeout(function() {
						$("body").hasClass("disable-hover") || $("body").addClass("disable-hover")
					}, 300)
				}), $(window).scrollEnd(function() {
					$("body").removeClass("disable-hover")
				}, 300), $("#search_kw").on("keydown", function(t) {
					13 == t.keyCode && r.searchEnter()
				}), $(".lazyload").lazyload(), $(p).bind("contextmenu", function(t) {
					return !Util.isIncludeTagName(t, ["IMG"]) || (t.preventDefault(), !1)
				}), r.scrollToTop(), r.baiduStatistics()
			}
		};
	r.init(), t ? module.exports = r : window.Global = r
}();
