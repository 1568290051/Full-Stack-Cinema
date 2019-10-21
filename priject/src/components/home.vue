<template>
  <div>
    <!-- 首页 -->
    <div class="box_viewpage">
      <!-- 版心 -->
      <div class="viewpage_type_area )">
        <ul class="viewpage_type_area_left all">
          <li v-for="(item,index) in ulData" :key="index" class="li reveal"  @click="jum(item.video_id)">
            <!-- 宣传照 -->
            <img :src="item.cover_path" :title="item.video_name" class="publicity" />
            <div class="right-message">
              <!-- 标题 -->
              <div class="right-message-title">
                <div>{{item.video_name}}</div>
                <span style="color:#fe6500;font-size:12px;">HD</span>
                <br />
                <!-- 影片信息 -->
                <div class="right-information">
                  <span class="information_option" style="width:500px;">
                    <label for>主演:</label>
                    {{item.to_star}}
                  </span>
                  <br />
                  <div class="information_option">
                    <label for>类型:</label>
                    {{item.typeSort_id}}
                  </div>
                  <div class="information_option">
                    <label for>导演:</label>
                    {{item.director}}
                  </div>
                  <div class="information_option">
                    <label for>年份:</label>
                    {{item.timeSort_id}}
                  </div>
                  <div class="information_option"  v-if="item.create_time">
                    <label for>时间:</label>
                    <span> {{item.create_time.substring(0,10)}}</span>
                  </div>
                </div>
              </div>
              <span class="right-information" style="width:500px;">
                <label for style="color: #999;">信息:</label>
                {{item.plot}}
              </span>
            </div>
          </li>
          <div class="Sudoku">
            <ul class="Sudoku_ui">
              <li v-for="(item,index) in ulData " :key="index">
                <img :src="item.cover_path" alt />
              </li>
            </ul>
          </div>
        </ul>
      </div>
    </div>
    <!-- 推荐影视 -->
    <div class="recommend">
      <div class="recommend_middle">
        <div class="recommend_middle-left">
          <span>推荐影视</span>
          <span class="recommend_a">
            <a
              v-for="item_header in random_data_header"
              :key="item_header.video_id"
              @click="jum(item_header.video_id)"
            >{{item_header.video_name}}</a>
          </span>
        </div>
        <div class="recommend_middle-right">
          <span>随机推荐</span>
        </div>
      </div>
    </div>
    <!-- 随机推荐 start================================================== -->
    <div class="HideLayer">
      <div class="HideLayer_middle">
        <ul class="H1_P">
          <li
            class="H1_P1"
            v-for="item_content in random_data_Content "
            :key="item_content.video_id"
                 @click="jum(item_content.video_id)"
          >
            <a >
              <img :src="item_content.cover_path" alt />

              <span class="video-bg"></span>
              <span class="lzbz-y">
                <p
                  class="name"
                  style="font-size: 16px; font-weight: 700px;color:#ffffff;"
                >{{item_content.video_name}}</p>
                <p class="actor">{{item_content.to_star}}</p>
                <p class="actor">{{item_content.typeSort_id}}</p>
                <p class="actor">{{item_content.timeSort_id}}/{{item_content.regionSort_id}}</p>
              </span>
              <p class="letter_p">
                <i class="letter">HD</i>
              </p>
            </a>
          </li>
          <!-- 假数据 -->
        </ul>
        <ul class="H2—1">
          <li v-for="(item_right,index) in random_data_Right" :key="item_right.video_id"       @click="jum(item_right.video_id)">
            <a  style="  text-decoration: none;">
              <span class="gm">{{0+index+1}}</span>
              <span class="H2—1_title" title="东游2019">{{item_right.video_name}}</span>
              <span>HD</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- 随机推荐end===================================================================== -->
    <!-- 影片 start========================================================================== -->
    <div class="film——box">
      <div class="film——box-middle">
        <div class="film_title">
          <h1>电影片</h1>
          <ul class="film_ul">
            <li>
              <a >更多>></a>
            </li>
            <li v-for="(movie_item,index) in classify_data" :key="index" >
              <a>{{movie_item.type_sort_name}}</a>
            </li>
          </ul>
        </div>
        <!-- 视屏部分 -->
        <div class="film_video">
          <ul class="H1_P" style="width:1200px;height:500px;">
            <li
              class="H1_P1"
              style="width:181px;height:230px; margin-right: 18px;"
              v-for="(item,index) in movie"
              :key="index"
               @click="jum(item.video_id)"
              
            >
              <a >
                <img :src="item.cover_path" alt />

                <span class="video-bg"></span>
                <span class="lzbz">
                  <p
                    class="name"
                    style="font-size: 16px; font-weight: 700px;color:#ffffff;"
                  >{{item.video_name}}</p>
                  <p class="actor">{{item.to_star}}</p>
                  <p class="actor">{{item.videoSort_id}}</p>
                  <p class="actor">{{item.timeSort_id}}/{{item.regionSort_id}}</p>
                </span>
                <p class="letter_p">
                  <i class="letter">HD</i>
                </p>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 影片 end========================================================================== -->
    <!-- 连续剧 start====================================================================== -->
    <div class="film——box">
      <div class="film——box-middle">
        <div class="film_title">
          <h1>连续剧</h1>
          <ul class="film_ul">
            <li>
              <a href>更多>></a>
            </li>
            <li v-for="(movie_item,index) in classify_dataB" :key="index">
              <a href>{{movie_item.type_sort_name}}</a>
            </li>
          </ul>
        </div>
        <!-- 视屏部分 -->
        <div class="film_video">
          <ul class="H1_P" style="width:1200px;height:500px;">
            <li
              class="H1_P1"
              style="width:181px;height:230px; margin-right: 18px;"
              v-for="(item,index) in Sitcom"
              :key="index"
                @click="jum(item.video_id)"
            >
              <a >
                <img :src="item.cover_path" alt />

                <span class="video-bg"></span>
                <span class="lzbz">
                  <p
                    class="name"
                    style="font-size: 16px; font-weight: 700px;color:#ffffff;"
                  >{{item.video_name}}</p>
                  <p class="actor">{{item.to_star}}</p>
                  <p class="actor">{{item.videoSort_id}}</p>
                  <p class="actor">{{item.timeSort_id}}/{{item.regionSort_id}}</p>
                </span>
                <p class="letter_p">
                  <i class="letter">HD</i>
                </p>
              </a>
            </li>
            <!-- 假数据 -->
           
          </ul>
        </div>
      </div>
    </div>
    <!-- 连续剧  end====================================================================== -->
    <!-- 动漫片 start====================================================================== -->
    <div class="film——box">
      <div class="film——box-middle">
        <div class="film_title">
          <h1>动漫片</h1>
          <ul class="film_ul">
            <li>
              <a >更多>></a>
            </li>
            <li v-for="(movie_item,index) in classify_dataC" :key="index">
              <a href>{{movie_item.type_sort_name}}</a>
            </li>
          </ul>
        </div>
        <!-- 视屏部分 -->
        <div class="film_video">
          <ul class="H1_P" style="width:1200px;height:500px;">
            <li
              class="H1_P1"
              style="width:181px;height:230px; margin-right: 18px;"
              v-for="(item,index) in Comic"
              :key="index"
              @click="jum(item.video_id)"
              >
                <span class="video-bg"></span>
                <span class="lzbz">
                  <p
                    class="name"
                    style="font-size: 16px; font-weight: 700px;color:#ffffff;"
                  >{{item.video_name}}</p>
                  <p class="actor">{{item.to_star}}</p>
                  <p class="actor">{{item.videoSort_id}}</p>
                  <p class="actor">{{item.timeSort_id}}/{{item.regionSort_id}}</p>
                </span>
                <p class="letter_p">
                  <i class="letter">HD</i>
                </p>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 动漫片 end============================================================================-->
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 轮播图数据
      ulData: [
        {
          video_id: "", //视频id
          video_name: "中国机长e21e21e12e12e12e12e12e12e1", //视频名字
          cover_path: "",
          video_path: "", //视频路径
          to_star: "", //主演
          director: "", //导演
          typeSort_id: "1",
          timeSort: "2019", //年份
          datetime: "2019-10-2", //上线时间
          plot: "" //剧情
        }
      ],
      // 视屏分类数据
      classify_data: [],
      classify_dataB: [],
      classify_dataC: [],
      // 获取随机推荐分类
      //  头部
      random_data_header: [],
      //  主体部分
      random_data_Content: [],
      // 右边推荐部分
      random_data_Right: [],
      // 电视剧
      Sitcom: [],
      // 动漫
      Comic: [],
      movie: [],
      video_id:''
    };
  },
  methods: {
    // 自循环、
    circulation() {
      let alink = [];
      alink = document.querySelectorAll(".viewpage_type_area_left .li");
      let section = document.querySelectorAll(".Sudoku_ui li");
      let Sudoku_ui = document.querySelector(".Sudoku_ui");

      alink[0].style.display = "block";
      section[0].style.border = "1px solid #ff6600 ";
      var i = 0;
      var dsq = setInterval(() => {
        if (i == 9) {
          section[8].style.border = "1px solid #cfd0d1 ";
          alink[8].style.display = "none";
          i = 0;
        }
        i++;
        alink[i - 1].style.display = "block";
        section[i - 1].style.border = "1px solid #ff6600 ";
        if (i == 1) {
          alink[0].style.display = "block";
          section[0].style.border = "1px solid #ff6600 ";
          // alink[i - 1].style.display = "none";
          // section[i - 1].style.border = "1px solid #cfd0d1 ";
        } else {
          alink[i - 2].style.display = "none";
          section[i - 2].style.border = "1px solid #cfd0d1 ";
        }

        if (i == 9) {
          section[8].style.border = "1px solid #ff6600 ";
          alink[8].style.display = "block";
        }
        if (i == 0) {
          section[8].style.border = "1px solid #cfd0d1 ";
          alink[8].style.display = "none";
        }
      }, 2000);

      // 九宫格
      for (let k = 0; k < section.length; k++) {
        // 鼠标点击 进去 停止轮播
        section[k].onclick = function() {
          clearInterval(dsq);
          for (var j = 0; j < section.length; j++) {
            section[j].style.border = "1px solid #cfd0d1 ";
            alink[j].style.display = "none";
          }

          this.style.border = "1px solid #ff6600 ";
          alink[k].style.display = "block";
       
          // section[k].onmouseout = function() {
          //   console.log(k);
          // };
          //   Sudoku_ui.onmouseout = function() {
          // i = k;
          // dsq = setInterval(() => {}, 1000);
        // };
        };
           // 鼠标移出来 轮播 图开始
      
      }
    },
    // 获取数据
    async get_ulData() {
      const { data: res } = await this.$http.get("/cinema");
      console.log(res)
      if ((res.code = 200)) {
        // 轮播图数据
        this.ulData = res.data.header.carousel;
                        // .substring(0,10)
                        console.log( res.data.header.carousel)
        // 视屏分类数据
        this.classify_data = res.data.header.nav[0].sobObject;
        this.classify_dataB = res.data.header.nav[1].sobObject;
        this.classify_dataC = res.data.header.nav[3].sobObject;
        // 获取随机推荐分类
        this.random_data_header = res.data.header.Recommend.recommendHeader;
        this.random_data_Content = res.data.header.Recommend.recommendContent;
        this.random_data_Right = res.data.header.Recommend.recommendRight;
        this.Comic = res.data.header.Comic;
        this.Sitcom = res.data.header.Sitcom;
        this.movie = res.data.header.movie;
      }
      //  console.log( res)
      // console.log( this.Comic)
      //   console.log( this.Sitcom)
      //     console.log( this.movie)
    },
    // 获取每个 视频的 id
    async jum(id){
      console.log(id)
        const { data: res } = await this.$http.get(`/cinema/details/${id}`);
      this.video_id = res.data.Videp
      this.$router.push(`/Details/${this.video_id}`);
    }
  },
  created() {
    // 获取数据
    this.get_ulData();
  },
  mounted() {},
  updated() {
    this.circulation();
  },
  beforeMount() {}
};
</script>
<style >
/* 轮播图 */
.box_viewpage {
  height: 350px;
  background-color: #1c1c1c;
  opacity: 1;
}
/* 版心 */
.viewpage_type_area {
  overflow: hidden;
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  background-color: #1c1c1c;
}
ul {
  list-style: none;
}
/* 左边轮播图 */
.viewpage_type_area_left {
  position: relative;
  width: 970px;
  height: 310px;
}
.viewpage_type_area_left .li {
  position: absolute;
  top: 0;
  left: 0;
  float: left;
  /* display: inline-block; */
  width: 100%;
  height: 310px;
}
/* 宣传照 */
.publicity {
  float: left;
  padding: 2px;
  border: 2px solid#1c1c1c;
  width: 228px;
  height: 308px;
}
/* 信息 */
.right-message {
  padding: 0 10px;
  position: absolute;
  top: 0px;
  right: 0px;
  width: 716px;
  height: 310px;
  background-color: #1c1c1c;
}
/* 标题 */
.right-message-title {
  color: white;
  font-weight: 400;
  font-size: 26px;
  font-family: "Microsoft Yahei";
}
/* 影片信息 */
.right-information {
  width: 500px;
  height: 100%;
  font-size: 14px;
  color: #ccc;
}
.information_option {
  margin: 10px 0;
  display: inline-block;
  line-height: 24px;
  width: 250px;
}
.information_option label {
  font-size: 14px;
  color: #999;
}
/* 右边九宫格 */
.Sudoku {
  position: absolute;
  top: 44px;
  right: -196px;
  /* top: 120px;
right: 316px; */
  width: 200px;
  height: 256px;
  background-color: black;
}
.Sudoku_ui {
  width: 207px;
  height: 258px;
  padding: 0px;
  list-style: none;
}
.Sudoku_ui li {
  float: left;
  margin-right: 5px;
  margin-bottom: 5px;
  width: 61px;
  height: 80px;
  border: 1px solid #ccc;
  cursor: pointer;
}
/* .Sudoku_ui li :hover {
  border: 2px solid #ff6600;
} */
.Sudoku_ui img {
  width: 61px;
  height: 80px;
  /* border: 1px solid #ffff; */
}
.reveal {
  display: none;
}
/* 推荐影视 */
.recommend {
  width: 100%;
  height: 67px;
  background-color: #e9e8ef;
  margin-bottom: 20px;
}
a{
  text-decoration:none;
  cursor: pointer;
}
.recommend_middle {
  overflow: hidden;
  width: 1200px;
  margin: 0 auto;
  height: 67px;
}
.recommend_middle-left {
  float: left;
  width: 930px;
  height: 100%;
  background-color: #f6f6f9;
  border-bottom: 1px solid #ccc;
  margin-bottom: 80px;
}
.recommend_middle-left span {
  display: inline-block;
  font-weight: 400;
  font-size: 23px;
  line-height: 289%;

  border-bottom: 1px solid #ccc;
}

.recommend_middle-right {
  float: left;
  margin-left: 20px;
  width: 248px;
  height: 100%;
  border-bottom: 1px solid #ccc;
  background-color: #f6f6f9;
}
.recommend_middle-right span {
  display: inline-block;
  width: 250px;
  margin-bottom: 15px;
  font-weight: 400;
  font-size: 23px;
  line-height: 289%;
  border-bottom: 1px solid #ccc;
}
.recommend_a {
  width: 838px;
  float: right;
}
.recommend_a a {
  float: right;
  text-decoration: none;
  font-size: 14px;
  padding-left: 20px;
  margin-left: 10px;
  /* width: 100px; */
  height: 66px;
  color: #333333;
}
.recommend_a a:hover {
  color: #f06000;
}
/* 视频 */
.HideLayer {
  width: 100%;
  height: 100%;
}
.HideLayer_middle {
  width: 1200px;
  margin: 0 auto;
  height: 670px;
  /* background-color: aqua; */
}
/* 影视组 */
.H1_P {
  float: left;
  margin: 0;
  padding: 0;
  width: 940px;
  height: 670px;
  list-style: none;
}
.H1_P .H1_P1 {
  position: relative;
  top: 0px;
  overflow: hidden;
  float: left;
  width: 140px;
  height: 200px;
  margin-right: 16px;
  margin-bottom: 20px;
  border-radius: 5px;
}

.H1_P1 img {
  width: 100%;
  height: 100%;
  border-radius: 5px;
}
.letter_p {
  position: absolute;
  box-sizing: 10px;
  top: 0;
  right: 0;
  margin: 0;
}
.letter {
  box-sizing: 10px;
  display: block;
  padding: 0 5px;
  background: #090;
  color: #fff;
  font-style: normal;
  border-radius: 0 10px 0 25px;
  opacity: 0.8;
}
/* 遮罩层 */
.video-bg {
  position: absolute;
  bottom: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 100%;
  background: #000 url("../assets/p.png") no-repeat scroll center 80%;
  line-height: 24px;
  opacity: 0.7;
  cursor: pointer;
  bottom: -196px;
}
.H1_P1 a:hover .lzbz,
.H1_P1 a:hover .video-bg {
  bottom: 0;
  transition: all 0.2s ease-in 0s;
}
.lzbz {
  position: absolute;
  left: 0;
  font-size: 12px;
  overflow: hidden;
  bottom: -205px;
  width: 100%;
  height: 100%;
  color: #999999;
  cursor: pointer;
}
.lzbz-y {
  position: absolute;
  left: 0;
  font-size: 12px;
  overflow: hidden;
  bottom: -175px;
  width: 100%;
  height: 100%;
  color: #999999;
  cursor: pointer;
}
/* 随机推荐 start */
.H2—1 {
  margin: 0;
  padding: 0;
  float: left;
  margin-left: 9px;
  list-style: none;
  /* background-color: #1c1c1c; */
  width: 251px;
  height: 644px;
}
.H2—1 li {
  width: 100%;
  height: 42px;
  text-align: left;
  line-height: 42px;
  border-bottom: 1px dashed #3333;
}

.H2—1 li :hover .H2—1_title {
  color: #f06000;
}
.H2—1 li .gm {
  text-align: center;
  line-height: 20px;
  display: inline-block;
  margin-right: 10px;
  width: 20px;
  color: white;
  height: 20px;
  background-color: green;
  border-radius: 5px;
}
.H2—1 li .gm :nth-child(3) {
  background-color: #f06000;
}
.H2—1 li .H2—1_title {
  display: inline-block;
  color: #555555;
  font-size: 12px;
  width: 160px;
  margin-right: 20px;
}
/* 随机推荐 end */
/* 影片区域 样式   start 公共样式========================================================================== */
.film——box {
  width: 100%;
  height: 562px;
  overflow: hidden;
}
.film——box-middle {
  width: 1200px;
  margin: 0 auto;
  height: 100%;
}
.film_title {
  width: 100%;
  height: 67px;

  overflow: hidden;
  border-bottom: 1px solid #3333;
}
.film_title h1 {
  display: inline-block;
  width: 200px;
}
.film_ul {
  float: right;
  margin: 19.92px;
  list-style: none;
}
.film_ul li {
  float: right;
  margin-right: 10px;
}
.film_ul li :hover {
  color: #f06000;
}
.film_ul li a {
  color: #333333;
  font-size: 12px;
  text-decoration: none;
}
.film_video {
  width: 100%;
  height: 510px;
}
/* .film_video_ul{

} */
/* 影片区域 样式   end */
</style>