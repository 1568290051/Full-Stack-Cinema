<template>
  <div>
    <el-container>
      <el-header>
        <!-- 面包屑导航 -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ }">{{nav.typeSort_id}}</el-breadcrumb-item>
          <el-breadcrumb-item>{{nav.video_name}}</el-breadcrumb-item>
        </el-breadcrumb>
      </el-header>

      <el-main>
        <!-- 电影介绍 -->
        <el-row :gutter="20">
          <!-- 电影海报 -->
          <!-- <template slot-scope="scope"> -->
          <el-col :span="6">
            <div class="grid-content bg-purple poster">
              <!-- <img :src="scope.row.cover_path" alt /> -->
              <img :src="detailsPic" alt />
            </div>
          </el-col>
          <!-- </template> -->
          <!-- 电影详情 -->
          <el-col :span="16">
            <div class="grid-content bg-purple">
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple details">{{detailsData.video_name}} HD</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple details">主演：{{detailsData.to_star}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="14">
                  <div class="grid-content bg-purple details">类型：{{detailsData.typeSort_id}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="11">
                  <div class="grid-content bg-purple details">导演：{{detailsData.director}}</div>
                </el-col>
                <el-col :span="7">
                  <div class="grid-content bg-purple details">地区：{{detailsData.regionSort_id}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="11">
                  <div class="grid-content bg-purple details">年份：{{detailsData.timeSort_id}}</div>
                </el-col>
                <el-col :span="7">
                  <div class="grid-content bg-purple details">语言：{{detailsData.language_id}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="14">
                <el-col :span="24">
                  <div
                    class="grid-content bg-purple details"
                  >介绍：{{detailsData.introduction}}{{detailsData.plot}}</div>
                </el-col>
              </el-row>
            </div>
          </el-col>
        </el-row>

        <!-- 电影集数 -->
        <el-tabs v-model="activeName">
          <el-tab-pane label="播放列表" name="first">
            <el-tabs type="border-card">
              <el-tab-pane label="OK播放①" style="color: #f06000">OK播放①</el-tab-pane>
              <el-tab-pane label="OK播放②">OK播放②</el-tab-pane>
            </el-tabs>
            <el-divider></el-divider>

            <!-- <template slot-scope="scope"> -->
              <el-button type="info" plain @click="jump">HD中字</el-button>
            <!-- </template> -->

            <el-divider></el-divider>
            <el-tabs type="border-card">
              <el-tab-pane label=" xunlei">需要安装迅雷下载工具</el-tab-pane>
            </el-tabs>
            <el-divider></el-divider>
            <el-button type="info" plain>HD中字</el-button>
          </el-tab-pane>
          <el-tab-pane label="相关影片" name="second">
            <el-tabs type="border-card">
              <el-tab-pane label=" xunlei">需要安装迅雷下载工具</el-tab-pane>
            </el-tabs>
            <el-divider></el-divider>
            <el-button type="info" plain>HD中字</el-button>
          </el-tab-pane>
        </el-tabs>

        <!-- 猜喜欢 -->
        <h2>猜你喜欢</h2>
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
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 电影导航
      nav: {
        // select: "国产动",
        // item: "罗小黑"
      },
      // 电影详情
      detailsData: [],
      // 接收电影的图片
      detailsPic: {},
      likeData: [
        {
          // 电影电视剧名称
          video_name: "哪吒之魔童降世",
          // 主演
          to_star: "",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2019",
          // 图片地址
          pic_address: require("../assets/Movie_details/哪吒.jpg")
        },
        {
          // 电影电视剧名称
          video_name: "斗罗大陆第1季",
          // 主演
          to_star: "沈磊,翟巍,吴磊,陶典",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2018",
          // 图片地址
          pic_address: require("../assets/Movie_details/斗罗大陆.jpg")
        },
        {
          // 电影电视剧名称
          video_name: "斗破苍穹第三季",
          // 主演
          to_star: "",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2019",
          // 图片地址
          pic_address: require("../assets/Movie_details/斗破苍穹.jpg")
        },
        {
          // 电影电视剧名称
          video_name: "画江湖之不良人3",
          // 主演
          to_star: "边江,朱雀橙,阎萌萌,赵毅",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2018",
          // 图片地址
          pic_address: require("../assets/Movie_details/画江湖.jpg")
        },
        {
          // 电影电视剧名称
          video_name: "罗小黑战记大电影",
          // 主演
          to_star: "山新 郝祥海 刘明月 ",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2019",
          // 图片地址
          pic_address: require("../assets/Movie_details/罗小黑.jpg")
        },
        {
          // 电影电视剧名称
          video_name: "天行九歌",
          // 主演
          to_star: "赵路,吴磊,翟巍,黄莺",
          // 类型
          type_sort_name: "国产动画",
          // 地区
          region_sort_name: "大陆",
          // 年份
          time_sort_name: "2016",
          // 图片地址
          pic_address: require("../assets/Movie_details/天行九歌.jpg")
        }
      ],
      recomData: [],
      // 播放列表
      activeName: "first",
      // 接收id容器
      idCont: [],
      // 传出去的id
      movieID: [],
      id: 1
    };
  },
  // mounted() {
  //   // 获得从电影分类得到的电影ID
  //   bus.$on("send", data => {
  //     console.log(data + "----------");
  //     this.idCont = data;
  //   });
  // },
  created() {
    // // 获得从电影分类得到的电影ID
    // bus.$on("send", data => {
    //   console.log(data + "----------");
    //   this.idCont = data;
    // });
    // console.log(this.$route.params.id);
    this.idCont = this.$route.params.id;
    // 获得电影详情页面数据
    this.getDetailsData();
  },
  methods: {
    async getDetailsData() {
      // 获取电影详情信息
      // console.log(this.idCont + "=============");
      const { data: res } = await this.$http.get(
        `/cinema/details/${this.idCont}`
      );
      console.log(res.data.video[0]);
      if (res.code !== 200) return this.$message.error("获取失败");
      // 绑定电影详情数据
      this.nav = res.data.video[0];
      this.detailsData = res.data.video[0];
      this.detailsPic = this.detailsData.cover_path;
      // console.log(this.detailsPic)
      // 绑定推荐详情
      this.recomData = res.data.RelatedVideos;
      console.log(this.recomData);
    },
    async jump() {
      // const { data: res } = await this.$http.get(
      //   `/cinema/details/${id}`
      // );
      // 把得到的电影ID存到容器里
      // this.movieID = res.data.video[0].video_id
      this.movieID = this.detailsData.video_id;
      this.$router.push(`/movie/${this.movieID}`);
    }
  }
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
.poster {
  width: 230px;
  height: 300px;
}
.poster img {
  width: 100%;
  height: 100%;
}
.details {
  color: #777;
  line-height: 28px;
  font-weight: 400;
  font-size: 18px;
  font-family: "Lucida Grande", Verdana, Tahoma, Lucida, Arial, Helvetica,
    "微软雅黑", "宋体", sans-serif;
}
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
