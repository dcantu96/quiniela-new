(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{1345:function(e,t,r){"use strict";var n=r(28),o=r(1346)(5),c=!0;"find"in[]&&Array(1).find(function(){c=!1}),n(n.P+n.F*c,"Array",{find:function(e){return o(this,e,arguments.length>1?arguments[1]:void 0)}}),r(251)("find")},1346:function(e,t,r){var n=r(94),o=r(250),c=r(95),l=r(77),m=r(1347);e.exports=function(e,t){var r=1==e,d=2==e,f=3==e,v=4==e,h=6==e,y=5==e||h,w=t||m;return function(t,m,x){for(var A,j,k=c(t),V=o(k),_=n(m,x,3),$=l(V.length),F=0,M=r?w(t,$):d?w(t,0):void 0;$>F;F++)if((y||F in V)&&(j=_(A=V[F],F,k),e))if(r)M[F]=j;else if(j)switch(e){case 3:return!0;case 5:return A;case 6:return F;case 2:M.push(A)}else if(v)return!1;return h?-1:f||v?v:M}}},1347:function(e,t,r){var n=r(1348);e.exports=function(e,t){return new(n(e))(t)}},1348:function(e,t,r){var n=r(38),o=r(552),c=r(17)("species");e.exports=function(e){var t;return o(e)&&("function"!=typeof(t=e.constructor)||t!==Array&&!o(t.prototype)||(t=void 0),n(t)&&null===(t=t[c])&&(t=void 0)),void 0===t?Array:t}},1361:function(e,t,r){"use strict";r.r(t);r(1345),r(63);var n=r(15),o=r(1131),c=r.n(o),l={middleware:"auth",asyncData:function(){var e=Object(n.a)(regeneratorRuntime.mark(function e(t){var r,n,o,l,data;return regeneratorRuntime.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return t.$axios,r=t.route,t.params,n=t.$auth,(o=new c.a({apiUrl:"http://localhost:8080/api/v1"})).headers.Authorization=n.getToken("local"),o.define("team",{name:"",abbreviation:"",sport:{jsonApi:"hasOne",type:"sports"}}),o.define("sport",{name:"",teams:{jsonApi:"hasMany",type:"teams"},tournaments:{jsonApi:"hasMany",type:"tournaments"}}),e.next=7,o.find("team",r.params.id,{include:"sport"});case 7:return l=e.sent,data=l.data,l.errors,l.meta,l.links,e.abrupt("return",{data:data});case 13:case"end":return e.stop()}},e)}));return function(t){return e.apply(this,arguments)}}(),beforeCreate:function(){this.form=this.$form.createForm(this)},methods:{updateTeam:function(){var e=Object(n.a)(regeneratorRuntime.mark(function e(){var t;return regeneratorRuntime.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.prev=0,(t=new c.a({apiUrl:"http://localhost:8080/api/v1"})).headers.Authorization=this.$auth.getToken("local"),t.define("team",{name:"",abbreviation:"",sport:{jsonApi:"hasOne",type:"sports"}}),t.define("sport",{name:"",teams:{jsonApi:"hasMany",type:"teams"},tournaments:{jsonApi:"hasMany",type:"tournaments"}}),e.next=7,t.update("team",{id:this.data.id,name:this.form.getFieldValue("name"),abbreviation:this.form.getFieldValue("abbreviation"),sport:{id:this.form.getFieldValue("sport")}});case 7:this.$toast.success("Team updated successfully!"),this.$router.push("/teams"),e.next=14;break;case 11:e.prev=11,e.t0=e.catch(0),this.$toast.error("Error while updating team!");case 14:case"end":return e.stop()}},e,this,[[0,11]])}));return function(){return e.apply(this,arguments)}}()}},m=r(19),component=Object(m.a)(l,function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("a-form",{attrs:{form:e.form,theme:"dark"},on:{submit:e.updateTeam}},[r("a-form-item",[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["name",{initialValue:e.data.name}],expression:"['name', { initialValue: data.name }]"}],attrs:{type:"text"}},[r("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"user"},slot:"prefix"})],1)],1),e._v(" "),r("a-form-item",[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["abbreviation",{initialValue:e.data.abbreviation}],expression:"['abbreviation', { initialValue: data.abbreviation }]"}],attrs:{type:"text",placeholder:"Abbreviation"}},[r("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"user"},slot:"prefix"})],1)],1),e._v(" "),r("a-form-item",[r("a-select",{directives:[{name:"decorator",rawName:"v-decorator",value:["sport",{initialValue:e.data.sport.id},{rules:[{required:!0,message:"Please select sport!"}]}],expression:"[\n        'sport',\n        { initialValue: data.sport.id },\n        {rules: [{ required: true, message: 'Please select sport!' }]}\n      ]"}],attrs:{placeholder:"Please select a sport"}},[r("a-select-option",{attrs:{value:"1"}},[e._v("NFL Football")]),e._v(" "),r("a-select-option",{attrs:{value:"2"}},[e._v("MLB Baseball")])],1)],1),e._v(" "),r("a-form-item",[r("a-button",{attrs:{type:"primary","html-type":"submit"}},[e._v("Update")])],1)],1)},[],!1,null,null,null);t.default=component.exports}}]);