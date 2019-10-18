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

      <el-main style="background: yellow">
        <el-row :gutter="20">
          <el-col :span="6">
            <div class="grid-content bg-purple">
              <img src="../assets/Movie_details/罗小黑.jpg" alt />
            </div>
          </el-col>
          <el-col :span="14">
            <div class="grid-content bg-purple" style="background: blue">
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple">{{details.video_name}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple">{{details.to_star}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple">{{details.type_sort_name}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="11">
                  <div class="grid-content bg-purple">{{details.director}}</div>
                </el-col>
                <el-col :span="7">
                  <div class="grid-content bg-purple">{{details.region_sort_name}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="11">
                  <div class="grid-content bg-purple">{{details.time_sort_name}}</div>
                </el-col>
                <el-col :span="7">
                  <div class="grid-content bg-purple">{{details.language_name}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="22">
                  <div class="grid-content bg-purple">
                    {{details.introduction}}{{details.plot}}</div>
                </el-col>
              </el-row>
            </div>
          </el-col>
        </el-row>
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
      },
      details: {
        // 电影电视剧名称
        video_name: "罗小黑战记大电影 HD",
        // 主演
        to_star: "山新 郝祥海 刘明月 ",
        // 类型
        type_sort_name: "国产动画",
        // 导演
        director: "木头 ",
        // 地区
        region_sort_name: "大陆",
        // 年份
        time_sort_name: "2019",
        // 语言
        language_name: "国语",
        // 介绍
        introduction:
          "介绍：欢迎在线观看由山新 郝祥海 刘明月 等主演的国产动《罗小黑战记大电影》，第一时间为你提供《罗小黑战记大电影》，如果你喜欢《罗小黑战记大电影》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！",
        // 剧情简介
        plot: '剧情简介:在熙攘的人类世界里，很多妖精隐匿其中，他们与人类相安无事地生活着。猫妖罗小黑因为家园被破坏，开始了它的流浪之旅。这场旅途中惺惺相惜的妖精同类与和谐包容的人类伙伴相继出现，让小黑陷入了两难抉择，究竟何处才是真正的归属？'
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
.el-row {
  margin-bottom: 20px;
}
</style>