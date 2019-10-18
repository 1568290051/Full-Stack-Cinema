<template>
  <div>
    <el-container>
      <el-header>
        <!-- 面包屑导航 -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ }">{{nav.select}}</el-breadcrumb-item>
          <el-breadcrumb-item>{{nav.item}}</el-breadcrumb-item>
        </el-breadcrumb>
      </el-header>

      <el-main style="background: red">
        
      </el-main>

      <!-- <el-footer style="background: blue">Footer</el-footer> -->
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      nav: {
        select: "国产动",
        item: "罗小黑"
      }
    };
  },
  created() {},
  methods: {}
};
</script>

<style>
html,
body,
#app,
.el-container {
  /*设置内部填充为0，几个布局元素之间没有间距*/
  padding: 0px;
  /*外部间距也是如此设置*/
  margin: 0px;
  /*统一设置高度为100%*/
  height: 100%;
}
body {
  background-color: #f6f6f9;
}
.el-main {
  height: 100%;
  width: 1200px;
  margin: 0 auto;
}
.el-breadcrumb {
  margin-bottom: 15px;
  padding: 15px 0 20px;
  font-weight: 400;
  font-size: 22px;
  border-bottom: 1px solid #ccc;
}
</style>