(window.webpackJsonp=window.webpackJsonp||[]).push([[11],{1358:function(t,e,n){"use strict";n.r(e);n(63);var r=n(15),c=(n(253),{middleware:"auth",asyncData:function(){var t=Object(r.a)(regeneratorRuntime.mark(function t(e){var n,r,c;return regeneratorRuntime.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return n=e.$axios,t.next=3,n.$get("/matches");case 3:return r=t.sent,c=r.data,t.abrupt("return",{matches:c});case 6:case"end":return t.stop()}},t)}));return function(e){return t.apply(this,arguments)}}()}),o=n(19),component=Object(o.a)(c,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("ul",t._l(t.matches,function(e){return n("li",[n("p",[t._v("Match: "+t._s(e.id))]),t._v(" "),n("p",[t._v("Date: "+t._s(e.attributes.date))])])}),0)])},[],!1,null,null,null);e.default=component.exports}}]);