<template>
  <div class="main">
    <h1 class="title">
      <a href="/home">首页</a>
      》
      <a href="/">电影片</a>
      》
      <a href="/">当前播放影片:</a>
    </h1>

    <!-- vied -->

    <embed :src="videoUrl" autostart="true" loop="true" width="1200" height="600" />


    <!-- video     end -->

    <div class="main">
      <div class="tab-title mb clearfix">
        <ul>
          <li class="err">

          </li>
          <li class="on">播放失败请刷新或切换播放地址</li>
        </ul>
      </div>

      <div id="stab1" class="playfrom tab8 clearfix">
        <div class="playfrom tab8 clearfix">
          <ul>
            <li id="tab81" onclick="setTab('tab8','stab8',1,2)" class="on">
              <i class="playerico ico-Azhan"></i> OK播放①
            </li>
            <li id="tab82" onclick="setTab('tab8','stab8',2,2)" class>
              <i class="playerico ico-Azhan"></i> OK播放②
            </li>
          </ul>
        </div>

        <div class="playlist clearfix" id="stab81" style="display: block;">
          <div class="h1 clearfix">
            <p class="intro">
              <font color="#f06000">OK播放</font>
            </p>

            <p class="jj">
              <span id="vlink_1_s1">
                <em>倒序</em>
              </span>
              <span id="vlink_1_s2">
                <em class="over">顺序</em>
              </span>
            </p>
          </div>

          <div class="videourl clearfix" id="vlink_1">
            <ul>
              <li>
                <a title="HD高清" href target="_self">H高清</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="cont-banner">
      <a href>【电影天堂_免费电影_OK资源网】求片，提意见：请点击这里给点宝贵的意见</a>
    </div>

    <!-- <div class="index-area clearfix">
      <h1 class="title index-color">猜你喜欢</h1>

      <ul>
        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/zuihaode.jpg"
              alt="最好的我们2019"
              style="display: inline;"
            />
            <span class="video-bg">最好的我们</span>
          </a>
        </li>
        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/feichi.jpg"
              alt="飞驰人生"
              style="display: inline;"
            />
            <span class="video-bg">飞驰人生</span>
          </a>
        </li>

        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/fengkuang.jpg"
              alt="疯狂的外星人"
              style="display: inline;"
            />
            <span class="video-bg">疯狂的外星人</span>
          </a>
        </li>

        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/xiju.jpg"
              alt="喜剧之王"
              style="display: inline;"
            />
            <span class="video-bg">喜剧之王</span>
          </a>
        </li>

        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/xihongshi.jpg"
              alt="西红柿首付"
              style="display: inline;"
            />
            <span class="video-bg">西红柿首付</span>
          </a>
        </li>
        <li class="p1 m1">
          <a href title="最好的我们">
            <img
              class="lazy"
              src="../assets/cover_img/renjian.jpg"
              alt="人间喜剧2019"
              style="display: inline;"
            />
            <span class="video-bg">人间喜剧2019</span>
          </a>
        </li>
      </ul>
    </div>-->
    <!-- 猜喜欢 -->
    <h2 style="margin-top:15px">猜你喜欢</h2>
    <el-divider></el-divider>
    <el-row :gutter="10" class="guessLike">
      <el-col :span="6" v-for="item in recomData" :key="item.id">
        <div class="grid-content bg-purple">
          <img :src="item.cover_path" alt />
          <span class="guessInc">
            <p>{{item.video_name}}</p>
            <p>{{item.to_star}}</p>
            <p>{{item.type_sort_name}}</p>
            <p>{{item.time_sort_name}}/{{item.region_sort_name}}</p>
          </span>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 电影地址
      videoUrl: "",
      // 接收id容器
      idCont: [],
      // 电影推荐
      recomData: [],
    };
  },
  created() {
    // 接收路由传过来的参数
    this.idCont = this.$route.params.id;
    this.getMovieData();
  },
  methods: {
    async getMovieData() {
      const { data: res } = await this.$http.get(
        `/cinema/details/${this.idCont}`
      );
      console.log(res);
      this.videoUrl = res.data.video[0].video_path;
      this.recomData = res.data.RelatedVideos;
      console.log(this.videoUrl);
    }
  }
};
</script>

<style>
.dplayer-video-wrap {
  position: relative;
  background: #000;
  font-size: 0;
  width: 100%;
  height: 100%;
}
.dplayer * {
  box-sizing: content-box;
}
.dplayer-video-wrap .dplayer-video-current {
  display: block;
}
.dplayer-video-wrap .dplayer-video {
  width: 100%;
  height: 100%;
  display: none;
}
.dplayer-video-wrap {
  position: relative;
  background: #000;
  font-size: 0;
  width: 100%;
  height: 100%;
}
body,
html,
.content {
  background-color: black;
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
  color: #999;
  position: absolute;
}

body,
html,
.content {
  background-color: black;
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
  color: #999;
  position: absolute;
}
.dplayer {
  user-select: none;
  line-height: 1;
}
body {
  margin: 0;
  padding: 0;
  background: #f6f6f9;
  color: #777;
  word-wrap: break-word;
  font-size: 14px;
  font-family: "Lucida Grande", Verdana, Tahoma, Lucida, Arial, Helvetica,
    "微软雅黑", "宋体", sans-serif;
  line-height: 140%;
  word-break: break-all;
}
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
  margin-top: 20px;
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
  
  border-radius: 10px;
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
.MacPlayer ul,
li,
h2 {
  margin: 0px;
  padding: 0px;
  list-style: none;
}
.mb {
  margin-bottom: 25px;
}
.clearfix {
  zoom: 1;
}
dd,
dl,
dt,
h2,
h3,
h4,
img,
li,
p,
ul {
  margin: 0;
  padding: 0;
  border: 0;
}
.playfrom li.on {
  border: 1px solid #ccc;
  border-bottom: 0;
  background: #f6f6f9;
  color: #333;
}
.playfrom li {
  float: left;
  padding: 0 10px;
  line-height: 30px;
  cursor: pointer;
}
.MacPlayer ul,
li,
h2 {
  margin: 0px;
  padding: 0px;
  list-style: none;
}

.playfrom .on .ico-Azhan {
  background-position: -120px -36px;
}
.playerico {
  display: inline-block;
  width: 18px;
  height: 18px;
  background: transparent no-repeat scroll 100% 100%;
  cursor: pointer;
}
element.style {
  display: block;
}
.playlist {
  margin-top: -1px;
  margin-bottom: 20px;
  border-top: 1px solid #ccc;
}
.clearfix {
  zoom: 1;
}
.playlist .h1 {
  padding: 5px;
  border-bottom: 1px dotted #d9d9d7;
  line-height: 30px;
}
.playlist .intro {
  /* float: left; */
  display: inline-block;
}
.clearfix::after {
  height: 0px;
  clear: both;
  font-size: 0px;
  display: block;
  visibility: hidden;
  content: " ";
}
.playlist .jj {
  /* float: right;/ */
  display: inline-block;
}
.playlist .jj span {
  margin-left: 10px;
}
.playlist .jj em {
  padding: 2px 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background: #f1f1f1;
  font-style: normal;
  cursor: pointer;
}
.playlist .jj em.over {
  background: #fff;
  color: #333;
}
.videourl {
  padding: 5px 0;
}
.videourl {
  margin-left: -10px;
}
.videourl li {
  float: left;
  overflow: hidden;
  padding: 5px 0;
  text-align: center;
}
.videourl li {
  margin-left: 10px;
  width: 111px;
  line-height: 34px;
}
.videourl li a {
  display: block;
  height: 40px;
  line-height: 40px;
  background: #eee;
  border-radius: 10px;
  border: 1px solid #d1d1d1;
  margin: auto auto;
}
.cont-banner a {
  display: block;
  height: 40px;
  line-height: 40px;
  font-size: 1.6rem;
  text-align: center;
  background: #00bb00;
  color: #fff;
  border-radius: 3px;
  overflow: hidden;
}
.clearfix {
  zoom: 1;
}
.index-color {
  height: 56px;
  color: #444;
  font-size: 25px;
}
.title {
  position: relative;
  margin-bottom: 15px;
  border-bottom: 1px solid #ccc;
  font-weight: 400;
  line-height: 200%;
  padding: 5px 0;
}
.index-area li {
  float: left;
  padding-bottom: 20px;
}
.p1 {
  margin-right: 20px;
  width: 180px;
  list-style: none;
  margin: 0;
  padding: 0;
}
element {
  display: inline;
}
.p1 img {
  width: 180px;
  height: 230px;
  border-radius: 5%;
}
.index-area .video-bg {
  bottom: -190px;
  border-radius: 20%;
}
.video-bg {
  width: 100%;
  height: 100%;
}
.p1 {
  margin-right: 20px;
  width: 180px;
}

/* 电影推荐 */
.guessLike .el-col {
  margin-right: 13px;
}
.guessLike div {
  position: relative;
  overflow: hidden;
  width: 180px;
  border-radius: 10px;
  height: 230px;
}
.guessLike div img {
  width: 180px;
  /* border-radius: 10px; */
  height: 230px;
}
.guessInc {
  position: absolute;
  bottom: -175px;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.7;
  cursor: pointer;
  background: #000 url("../assets/Movie_details/p.png") no-repeat scroll center
    80%;
}
.guessLike .el-col div:hover .guessInc {
  position: absolute;
  bottom: 0;
  transition: all 0.5s;
}
.guessInc p {
  /* font-size: 20px; */
  margin: 0;
  padding: 0 10px;
  color: #bfbfde;
  height: 30px;
  line-height: 30px;
}
.guessInc p:first-child {
  margin-top: 10px;
  height: 40px;
  color: #fff;
  font-weight: 800;
  font-size: 17px;
  line-height: 40px;
}
</style>



