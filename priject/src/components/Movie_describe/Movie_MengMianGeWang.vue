<template>
  <!-- 面包屑 -->
  <div class="main">
    <br />
    <div class="bread">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }">
          <a href>首页</a>
        </el-breadcrumb-item>
        <el-breadcrumb-item>
          <a href>日韩综</a>
        </el-breadcrumb-item>
        <el-breadcrumb-item>
          <a href>蒙面歌王</a>
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="blank"></div>
    <!-- 内容区 -->
    <div class="container">
      <div>
        <div class="picture">
          <img src="../../assets/Movie_img/Movie_MengMianGeWang.jpg" alt />
        </div>
      </div>
      <div class="describe">
        <span class="tt"></span>
        <span class="gray">&nbsp;更新至20191013</span>
        <br />
        <span class="gray">
          主演：
          <a href>金叡园&nbsp;</a>
          <a href>申宝拉&nbsp;</a>
          <a href>金九拉&nbsp;</a>
          <a href>洪恩熙&nbsp;</a>
          <a href>金亨石&nbsp;</a>
          <a href>池尚烈&nbsp;</a>
          <a href>金成柱&nbsp;</a>
        </span>
        <br />
        <span class="gray">
          类型：
          <a href>日韩综</a>
        </span>
        <br />
        <span class="gray">
          导演：
          <a href>민철기&nbsp;</a>
          <a href>노시용</a>
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      id: 9,
      //   数据
      cinemaData: []
    };
  },
  methods:{
    async showData() {
      let { data: res } = await $http.get("/cinema/details/:",{
        params: this.id
      });
      cosnole.log($http);
    }
  },
  created() {
    this.showData();
  }
};
</script>

<style>
.main {
  margin: 0 auto;
  width: 80%;
}
.bread {
  margin: 0 auto;
  height: 30px;
  line-height: 30px;
  font-size: 18px;
  border-bottom: 1px solid #cccccc;
}
.bread a {
  text-decoration: none;
  color: #333333;
}
.bread a:hover {
  color: #f06000;
}
.blank {
  height: 20px;
}
.container {
  width: 100%;
  overflow: hidden;
}
.container .picture img {
  width: 20%;
  float: left;
  border-radius: 10px;
}
.container .describe {
  float: right;
  width: 78%;
  border: 1px solid greenyellow;
}
.container .describe .tt {
  font-size: 17px;
  font-weight: bold;
}
.container .describe .gray {
  color: #777777;
}
.container .describe .gray a {
  text-decoration: none;
  color: #333333;
}
.container .describe .gray a:hover {
  color: #f06000;
}
</style>