<%--
  Created by IntelliJ IDEA.
  User: yeyx
  Date: 2017/9/21
  Time: 上午12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<%
    String path =  "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <script type="text/javascript" src="<%=basePath%>js/vue.min.js"></script>
</head>
<body>
<div><%=path%></div>
<div><%=basePath%></div>
<div id="app">
    <p v-if="seen">现在你看到我了</p>
    <template v-if="ok">
        <h1>菜鸟教程</h1>
        <p>学的不仅是技术，更是梦想！</p>
        <p>哈哈哈，打字辛苦啊！！！</p>
    </template>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            seen: true,
            ok: true
        }
    })
</script>

<hr/>

<div id="app2">
    <p v-once>'单次插值: '+{{message}}</p> <!--单次插值,今后的数据变化就不会再引起插值更新了-->
    <p>'实时响应: '+{{ message }}</p> <!--这个值可以实时响应-->
    <!-- 字符串连接 -->
    <p>'字符串连接: '+{{ message + '官网地址：www.runoob.com' }}</p>
    <!-- 字符串反转 -->
    <p>'字符串反转'+{{ message.split('').reverse().join('') }}</p>
    <p v-bind:title="message">
        鼠标悬停几秒钟查看此处动态绑定的提示信息！
    </p>
    <input v-model="message" />
    <button v-on:click="addMessage">添加到app3中</button>
</div>
<script>
    var i = 3;
    new Vue({
        el: '#app2',
        data: {
            message: '菜鸟教程!'
        },
        methods: {
            addMessage: function () {
                // this.message = this.message.split('').reverse().join('')
                app3.groceryList.push({id:i,text:this.message})
            }
        }
    })
</script>


<div id="app-3">
    <ol>
        <!--
          现在我们为每个 todo-item 提供 todo 对象
          todo 对象是变量，即其内容可以是动态的。
          我们也需要为每个组件提供一个“key”，晚些时候我们会做个解释。
        -->
        <todo-item
                v-for="item in groceryList"
                v-bind:todo="item"
                v-bind:key="item.id">
        </todo-item>
    </ol>
</div>
<script>
    Vue.component('todo-item', {
        props: ['todo'],
        template: '<li v-bind:title="todo.text">{{ todo.text }}</li>'
    });
    var app3 = new Vue({
        el: '#app-3',
        data: {
            groceryList: [
                { id: 0, text: '蔬菜' },
                { id: 1, text: '奶酪' },
                { id: 2, text: '随便其他什么人吃的东西' }
            ]
        }
    });
    app3.groceryList.push({id:3,text:'new push item'});
    // $watch 是一个实例方法
    app3.$watch('groceryList', function (newValue, oldValue) {
        // 这个回调将在 `app3.groceryList` 改变后调用
        alert(newValue.length);
    })
</script>


</body>
</html>
