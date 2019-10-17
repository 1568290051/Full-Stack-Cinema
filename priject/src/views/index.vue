<template>
  <div id="app">
    <el-container>
      <!-- 头部 -->
      <!-- 导航 start -->
      <el-header style="height: 60px;padding-left: 0px;padding-right: 0px;">
        <el-row>
          <el-col :span="24">
            <div class="nav">
              <!-- 中心 -->
              <div class="type_area">
                <el-menu
                  class="el-menu-demo"
                  mode="horizontal"
                  :unique-opened="true"
                  :router="true"
                  background-color="black"
                  text-color="#fff"
                  active-text-color="#ffd04b"
                >
                  <el-menu-item index="/home">首页</el-menu-item>
                  <el-submenu :index="item.path" v-for="item in menuList" :key="item.id">
                    <template slot="title">{{item.name}}</template>
                    <el-menu-item
                      :index="item2.type_sort_path"
                      v-for="item2 in item.sobObject"
                      :key="item2.type_sort_id"
                    >{{item2.type_sort_name}}</el-menu-item>
                  </el-submenu>
                </el-menu>
                <el-input
                  placeholder="输入关键字搜索"
                  v-model="search"
                  style="width:156px;  position: fixed;
  top: 12px;right:200px;"
                >
                  <i slot="prefix" class="el-input__icon el-icon-search"></i>
                </el-input>

                <router-link to style="width:156px;  position: fixed;
  top: 12px;right:21px;">
                  <el-button>登录</el-button>
                </router-link>
                <!-- 注册路径 to='/....' -->
                <router-link to='/register' style="width:156px;  position: fixed;
  top: 12px;right:-55px;">
                  <el-button>注册</el-button>
                </router-link>
              </div>
            </div>
          </el-col>
        </el-row>

        <!-- 导航 end-->
      </el-header>
      <!-- 中部 start -->
      <!-- 去除两边空隙 -->
      <el-main
        style="height: 60px;padding-left: 0px;padding-right: 0px;padding-bottom: 5px;border-top-width: 0px;padding: 0px"
      >
        <router-view></router-view>
      </el-main>
      <!-- 中部 end -->

      <!-- 底部 start -->
      <el-footer style="height: 60px;padding-left: 0px;padding-right: 0px;">
        <!-- 去除两边空隙 -->
        <el-row>
          <el-col>
            <!-- 底部 -->
            <div class="Bottom">
              <!-- 底部版心 -->
              <div class="Bottom_type_area">
                <div class="disclaimer">
                  免责声明:本站所有视频均来自互联网收集而来，版权归原创者所有，如果侵犯了你的权益，请通知我们，我们会及时删除侵权内容，谢谢合作。流量统计站长统计
                  <div>Copyright © 2019-2019 《免费电影_OK资源》</div>
                </div>
                <div class="copyright"></div>
              </div>
            </div>
          </el-col>
        </el-row>
      </el-footer>
      <!-- 底部 end -->
    </el-container>
  </div>
</template>
<script>
export default {
  data() {
    return {
      //菜单数据 -假数据
      menuList: [
    
      ],
      // 搜索内容
      search: ""
    };
  },
  methods: {
     async showGoodsData() {
      const { data: res } = await this.$http.get("/cinema");
      console.log(res.code);
      if (res.code == 200) {
        this.menuList = res.data.header.nav;
      }
    }

  },
  created() {
   this.showGoodsData()
  },
};
</script>
<style>
/* 初始化 */
html,
body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
}
#app {
  width: 100%;
  height: 100%;
}
.el-container {
  width: 100%;
  height: 100%;
}

/* 导航样式 */
.nav {
  position: fixed;
  top: 0;
  width: 100%;
  height: 60px;
  background-color: black;
  z-index: 100;
}
.type_area {
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  background-color: #f0f8ff;
}
/* 中间区域样式 */
.el-main {
  background-color: #f0f8ff;
}
/* 底部 */
.Bottom {
  background-color: #f0f8ff;
  width: 100%;
  height: 100px;
}
/* 底部版心 */
.Bottom_type_area {
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  background-color: #e9e8ef;
}
/* 免责声明 */
.disclaimer {
  padding: 20px 0;
  color: #777777;
  font-size: 12px;
  border-top: 1px solid #555;
  background: #e9e8ef;
  text-align: center;
  line-height: 30px;
}
</style>