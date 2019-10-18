<template>
  <div class="science">
    <h1>
      <el-breadcrumb separator-class="el-icon-arrow-right" class="title">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>
          <a href="Record">记录片</a>
        </el-breadcrumb-item>
      </el-breadcrumb>
    </h1>
    <div class="sy-all mb">
      <div class="sy-title">
        <p class="type">
          <span class="type">记录片</span>
        </p>
        <p class="chg" @click="screen">
          筛选
          <i class="el-icon-caret-bottom bottom"></i>
          <i class="el-icon-caret-top top"></i>
        </p>
      </div>
      <div class="sy-nav-down clearfix">
        <div class="sy clearfix" style="display: none;">
          <dl class="clearfix">
            <dt>
              <span>按分类</span>
            </dt>
            <dd @click="query($event)">
              <a href="#">全部</a>
            </dd>
            <dd @click="query($event)">
              <a href="ActionMovie">动作片</a>
            </dd>
            <dd @click="query($event)">
              <a href="Comedy">喜剧片</a>
            </dd>
            <dd @click="query($event)">
              <a href="love">爱情片</a>
            </dd>
            <dd @click="query($event)">
              <a href="scienceFiction">科幻片</a>
            </dd>
            <dd @click="query($event)">
              <a href="Horror">恐怖片</a>
            </dd>
            <dd @click="query($event)">
              <a href="plot">剧情片</a>
            </dd>
            <dd @click="query($event)">
              <a href="Warfare">战争片</a>
            </dd>
            <dd @click="query($event)">
              <a href="Record" class="on">记录片</a>
            </dd>
          </dl>
          <dl class="clearfix">
            <dt>
              <span>按年代</span>
            </dt>
            <dd @click="query($event)">
              <a href="#" class="on">全部</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2019</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2018</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2017</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2016</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2015</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2014</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2013</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2012</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2011</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2010</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2009</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2008</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2007</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2006</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2005</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2004</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2003</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2002</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2001</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">2000</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">1999</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">1998</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">1997</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">1996</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">1995</a>
            </dd>
          </dl>
          <dl class="clearfix">
            <dt>
              <span>按地区</span>
            </dt>
            <dd @click="query($event)">
              <a href="#" class="on">全部</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">大陆</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">香港</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">台湾</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">美国</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">韩国</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">日本</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">泰国</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">新加坡</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">马来西亚</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">印度</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">英国</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">法国</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">加拿大</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">西班牙</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">俄罗斯</a>
            </dd>
            <dd @click="query($event)">
              <a href="#">其他</a>
            </dd>
          </dl>
        </div>
      </div>
    </div>
    <div class="sy-jg mb">
      <p class="jg">
        共
        <span class="count">{{total}}</span>个筛选结果
      </p>
      <p class="px">
        <a class="time on" href="#">
          <em></em>
          最新
        </a>
        <a class="rq" href="#">
          <em></em>
          人气
        </a>
        <a class="tj" href="#">
          <em></em>
          推荐
        </a>
      </p>
    </div>
    <div class="index-area clearfix">
      <ul>
        <li class="p1 m1" v-for="(item,index) in movieList" :key="index">
          <router-link class="link-hover" :to="item.video_path" :title="item.video_name">
            <img
              class="lazy"
              :src="item.cover_path"
              :alt="item.video_name"
              style="display: inline;"
            >
            <span class="video-bg"></span>
            <span class="lzbz">
              <p class="name">{{item.video_name}}</p>
              <p class="actor">{{item.to_star}}</p>
              <p class="actor">{{item.typeSort_id}}</p>
              <p class="actor">{{item.timeSort_id}}/{{item.regionSort_id}}</p>
            </span>
            <p class="other">
              <i>HD</i>
            </p>
          </router-link>
        </li>
      </ul>
    </div>
    <el-pagination
      class="page mb clearfix"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="queryInfo.page"
      :page-size="queryInfo.page_size"
      background
      layout="total, prev, pager, next, jumper"
      :total="total"
    ></el-pagination>
  </div>
</template>

<script>
export default {
  data() {
    return {
      queryInfo: {
        page: 1, // 当前页
        page_size: 5 // 每页条数
      },
      // 总条数
      total: 0,
      // 电影列表
      movieList: []
    };
  },
  created: function() {
    this.getMovieList();
  },
  methods: {
    // 获取电影列表
    async getMovieList() {
      const { data: res } = await this.$http.get(
        "/selectVideo?video_sort_id=1&type_sort_id=8"
      );
      console.log(res);
      // 如果没有成功，提示一下用户
      if (res.code !== 200) {
        return this.$message.error("获取电影列表失败！");
      }
      this.movieList = res.data;
      this.total = res.total;
    },
    // 处理pageSize改变的事件
    handleSizeChange(size) {
      this.queryInfo.page_size = size;
      this.getMovieList();
    },
    // 处理pagenum改变的事件
    handleCurrentChange(num) {
      this.queryInfo.page = num;
      this.getMovieList();
    },
    // 筛选
    screen() {
      let bottom = document.querySelector(".bottom");
      let top = document.querySelector(".top");
      let content = document.querySelector(".sy");
      let p = document.querySelector(".chg");
      if (
        bottom.style.display == "" ||
        bottom.style.display == "inline-block"
      ) {
        bottom.style.display = "none";
        top.style.display = "inline-block";
        content.style.display = "block";
        p.classList.add("cur");
      } else if (bottom.style.display == "none") {
        bottom.style.display = "inline-block";
        top.style.display = "none";
        content.style.display = "none";
        p.classList.remove("cur");
      }
    },
    // 查询
    query(event) {
      // 获取子元素
      let el = event.currentTarget.firstElementChild;
      // 获取父级元素
      let fu = event.currentTarget.parentElement;
      for (var i = 0; i < fu.children.length; i++) {
        for (var j = 0; j < fu.children[i].children.length; j++) {
          fu.children[i].children[j].classList.remove("on");
        }
      }
      el.classList.add("on");
    }
  }
};
</script>

<style scoped>
.science {
  margin: 0 auto;
  padding: 0;
  width: 1200px;
  height: 100%;
}

a:link {
  color: #555;
  text-decoration: none;
}

a:hover {
  color: #f06000;
  text-decoration: none;
}

a:visited {
  color: #666;
  text-decoration: none;
}

li {
  list-style: none;
}

/* .main {
  margin: 0 auto;
  padding: 0;
  width: 1200px;
} */

.title {
  position: relative;
  margin-bottom: 15px;
  border-bottom: 1px solid #ccc;
  font-weight: 400;
  font-size: 16px;
  line-height: 200%;
  padding: 5px 0;
}

/* .title a {
  cursor: pointer;
}

.title a:hover {
  color: #f06000;
} */

.sy-all {
  position: relative;
  z-index: 1;
}

.mb {
  margin-bottom: 25px;
}

.sy-title {
  height: 40px;
  border: 1px solid #e8e8e8;
  background: #fff;
  line-height: 40px;
}

.sy-title p.type {
  float: left;
  /* display: inline-block; */
}

.sy-title span.type {
  margin-left: 5px;
  padding: 4px 5px;
  border-radius: 2px;
  background: #f06000;
  color: #fff;
  font-size: 14px;
}

.sy-title p.chg {
  float: right;
  /* display: inline-block; */
  padding: 0 10px;
  height: 40px;
  border-left: 1px solid #e8e8e8;
  color: #f06000;
  cursor: pointer;
  font-size: 14px;
}

.sy-title p.cur {
  margin-bottom: -1px;
  height: 41px;
  background: #fff;
  color: #009000;
}

.sy-title .bottom {
  display: inline-block;
  overflow: hidden;
  margin-bottom: -1px;
  margin-left: 5px;
  width: 0;
  height: 0;
  border-color: #f00600 transparent transparent transparent;
  border-style: solid dashed dashed dashed;
  border-width: 4px;
  line-height: 0;
}

.sy-title .top {
  display: none;
  overflow: hidden;
  margin-left: 5px;
  width: 0;
  height: 0;
  margin-bottom: 4px;
  border-color: transparent transparent #009000 transparent;
  border-style: solid dashed dashed dashed;
  border-width: 4px;
  line-height: 0;
}

.sy-title .cur .sjbgx {
  display: inline-block;
}

.sy-nav-down {
  position: absolute;
  top: 42px;
  left: 0;
  width: 100%;
  font-size: 14px;
}

.sy-nav-down .sy {
  border-color: #e8e8e8;
  border-style: solid;
  border-width: 0 1px 1px 1px;
  box-shadow: 0 0 0 0 transparent;
}

.sy {
  padding: 5px;
  background: #fff;
}

.sy dd,
.sy dt {
  padding: 5px 0;
  width: 70px;
  text-align: center;
}

.sy dd,
.sy dt {
  float: left;
}

.sy dd a,
.sy dt span {
  display: block;
  margin: 0 auto;
  padding: 5px 0;
  width: 90%;
  border-radius: 10px;
  background-color: #f5f5f5;
  color: #777;
}

.sy dd a:hover {
  background: #ddd;
  color: #f06000;
}

.sy dd a.on,
.sy dd a.on:hover {
  background: #f06000;
  color: #fff;
}

.sy dt span {
  background: #f1f1f1;
  color: #333;
}

.sy-jg {
  height: 27px;
  line-height: 27px;
  font-size: 14px;
  color: #777;
}

.sy-jg p.jg {
  float: left;
  /* display: inline-block; */
  height: 27px;
}

.sy-jg span.count {
  color: #f06000;
}

.sy-jg p.px {
  float: right;
  /* display: inline-block; */
  height: 27px;
}

.sy-jg p.px a {
  position: relative;
  display: inline-block;
  padding: 0 20px;
  height: 30px;
}

.sy-jg a.on {
  color: #f06000;
}

.sy-jg a.time em {
  position: absolute;
  top: 5px;
  left: -2px;
  float: left;
  display: block;
  overflow: hidden;
  width: 16px;
  height: 16px;
  background: transparent url(../assets/duomi-bg.png) no-repeat scroll -146px -160px;
}

.sy-jg a.time.on em,
.sy-jg a.time:hover em {
  background-position: -69px -160px;
}

.sy-jg a.rq em {
  position: absolute;
  top: 5px;
  left: -2px;
  float: left;
  display: block;
  overflow: hidden;
  width: 16px;
  height: 16px;
  background: transparent url(../assets/duomi-bg.png) no-repeat scroll -248px -227px;
}

.sy-jg a.rq.on em,
.sy-jg a.rq:hover em {
  background-position: -247px -194px;
}

.sy-jg p.px .tj {
  padding-right: 0;
}

.sy-jg a.tj em {
  position: absolute;
  top: 5px;
  left: -2px;
  float: left;
  display: block;
  overflow: hidden;
  width: 18px;
  height: 16px;
  background: transparent url(../assets/duomi-bg.png) no-repeat scroll -173px -160px;
}

.sy-jg a.tj.on em,
.sy-jg a.tj:hover em {
  background-position: -106px -160px;
}

.clearfix::after {
  height: 0px;
  clear: both;
  font-size: 0px;
  display: block;
  visibility: hidden;
  content: " ";
}

.p1 {
  margin-right: 20px;
  width: 180px;
}

.index-area li,
.index-tj-l li {
  float: left;
  padding-bottom: 20px;
  font-size: 14px;
}

.link-hover {
  position: relative;
  display: block;
}

.index-area .link-hover {
  position: relative;
  overflow: hidden;
  width: 180px;
  border-radius: 10px;
  height: 230px;
}

.p1 img {
  width: 180px;
  height: 230px;
}

.video-bg {
  position: absolute;
  bottom: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 100%;
  background: #000 url(../assets/p.png) no-repeat scroll center 80%;
  line-height: 24px;
  opacity: 0.7;
  cursor: pointer;
}

.index-area .lzbz,
.index-area .video-bg {
  bottom: -190px;
}

.index-area .lzbz,
.index-tj-l .lzbz {
  position: absolute;
  left: 0;
  overflow: hidden;
  width: 100%;
  height: 100%;
  color: #fff;
  cursor: pointer;
}

.index-area li p.name {
  height: 40px;
  color: #fff;
  font-weight: 800;
  font-size: 14px;
  line-height: 40px;
}

.index-area li p {
  padding: 0 10px;
}

.index-area li p {
  overflow: hidden;
  height: 30px;
  line-height: 30px;
}

.link-hover:hover .lzbz,
.link-hover:hover .video-bg {
  bottom: 0;
  transition: all 0.2s ease-in 0s;
}

.index-area li p.actor,
.index-tj-l li p.actor {
  color: #bfbfde;
}

.index-area li p.other,
.index-tj-l li p.other {
  top: 0;
  right: 0;
}

.index-area li p.other {
  height: 40px;
  line-height: 40px;
}

.index-area li p.other,
.index-tj-l li p.other {
  position: absolute;
  overflow: hidden;
  padding: 0;
  color: #bfbfde;
  font-size: 12px;
  cursor: pointer;
}

.index-area li p.other i,
.index-tj-l li p.other i {
  padding: 0 5px;
}

.index-area li p.other i,
.index-tj-l li p.other i {
  display: block;
  padding: 0 5px;
  background: #090;
  color: #fff;
  font-style: normal;
  border-radius: 0 10px 0 25px;
  opacity: 0.8;
}

.page {
  text-align: center;
}
</style>
