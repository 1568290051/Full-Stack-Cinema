<template>
  <div class="main">
    <h1 class="title">
      <a href="/">首页</a>
      》
      <a href="/">电影片</a>
      》
      <a href="/">明天也一定要和你谈恋爱</a>
    </h1>

    <div class="main">
      <div class="tab-title mb clearfix">
        <ul>
          <li class="err">
            <a target="_self" href="javascript:void(0)">我要报错</a>
          </li>
          <li class="on">播放失败请刷新或切换播放地址</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style>
html {
  font-size: 62.5%;
}
.main {
  margin: 0 auto;
  width: 1200px;
}
.title {
  position: relative;
  margin-bottom: 15px;
  border-bottom: 1px solid #ccc;
  font-weight: 400;
  font-size: 16px;
  line-height: 200%;
  padding: 5px 0;
  font-family: "Lucida Grande", Verdana, Tahoma, Lucida, Arial, Helvetica,
    "微软雅黑", "宋体", sans-serif;
  color: #777;
}
.title a {
  color: #333;
  text-decoration: none;
}
.sy-all {
  position: relative;
  z-index: 1;
}
.mb {
  margin-bottom: 25px;
}
.clearfix {
  zoom: 1;
}
.tab-title {
  height: 40px;
  line-height: 40px;
}
.mb {
  margin-bottom: 25px;
}
.clearfix {
  zoom: 1;
}
.tab-title li.err {
  float: right;
  margin-right: 0;
  cursor: default;
}
.tab-title li {
  float: left;
  margin-right: 20px;
  padding: 0 15px;
  background: #fff;
  font-weight: 800;
  cursor: pointer;
  list-style: none;
  text-decoration: none;
}
.tab-title li.err a {
  color: #333;
}
a:link {
  color: #555;
  text-decoration: none;
}
.tab-title li.on {
    background: #f06000;
    color: #fff;
}
.tab-title li {
    float: left;
    padding: 0 15px;
    background: #fff;
    font-weight: 800;
    border-radius: 10px;
    cursor: pointer;
}
.MacPlayer ul, li, h2 {
    margin: 0px;
    padding: 0px;
    list-style: none;
}
</style>