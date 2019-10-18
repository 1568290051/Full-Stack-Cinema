// 引入express
const express = require('express')
// 引入md5_key
const md5_key = require('../config').md5_key
// 引入md5
const md5 = require('md5')
// 引入数据库
const db = require('../db')
// 使用express创建路由
const router = express.Router()
// 定义
const apiName = 'cinema'

let  data = {
    header:{
     nav:[
         {
             id:0,
             name :'',
             path:"",
             sobObject:[
             ]
         },
         {
             id:0,
             name :'',
             path:"",
             sobObject:[]
         },
         {
             id:0,
             name :'',
             path:"",
             sobObject:[]
         },
         {
             id:0,
             name :'',
             path:"",
             sobObject:[]
         }
     ],
     carousel:[],
     Recommend:{
         recommendHeader:[],
         recommendContent:[],
         recommendRight:[]
     },
     movie:[],
     Sitcom:[],
     Variety:[],
     Comic:[]

 }}

// 首页初始化查询
router.get(`/${apiName}/`,(req,res)=>{
    // 轮播图部分数据
let carouselSql = "select * from video ORDER BY create_time desc limit 9"
db.query(carouselSql,(error,results)=>{
         if(error){
             console.log(error)
         }else{
            let timeId = [];
            let regionId  = [];
            let typeId = [];
            let videoId = [];
            let languageId = [];
            // for循环查询timeSort
           
            for(let index = 0;index<results.length;index++){
                // console.log(results[0].timeSort_id)
                timeId.push(results[index].timeSort_id)
                regionId.push(results[index].regionSort_id)
                typeId.push(results[index].typeSort_id)
                videoId.push(results[index].videoSort_id)
                languageId.push(results[index].language_id)
                // console.log(languageId)
                let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
                db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
                ,record,(error,resultTime)=>{
                        if(error){
                            console.log(error,1)
                        }else{
                            // console.log(resultTime,results[0].videoSort_id)
                         results[index].timeSort_id = resultTime[0].time_sort_name
                         results[index].regionSort_id = resultTime[0].region_sort_name
                         results[index].typeSort_id = resultTime[0].type_sort_name
                         results[index].videoSort_id = resultTime[0].video_sort_name
                         results[index].language_id = resultTime[0].language_name
                        //  console.log(results[index].timeSort_id,1)
                        }
                        if(index>=results.length-1){
                            for(let index = 0;index<results.length;index++){
                                // data.header.Recommend.recommendHeader.push(results[index])
                                data.header.carousel = results;
                                // console.log(data.header.Recommend.recommendHeader)
                            }
                        }
                })
            }
           
         }
})
let navigationSql = 'select  video_sort_id,video_sort_name,video_sort_path from video_sort'
// 推荐部分顶部五个随机推荐
db.query('select * from video ORDER BY RAND() limit 5',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
    
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Recommend.recommendHeader = results
                        console.log( data.header.Recommend.recommendHeader)
                        // console.log(data.header.Recommend.recommendHeader)
                    }
                }
        })
    }
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 推荐部分 18个随机推荐电影
db.query('select * from video where  videoSort_id = 1  ORDER BY RAND() limit 18',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
   
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Recommend.recommendContent = results
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 随机推荐15个电视剧
db.query('select * from video where  videoSort_id = 2  ORDER BY RAND() limit 15',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
  
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Recommend. recommendRight = results
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 最新的12部电影
db.query('select * from video where  videoSort_id = 1  ORDER BY create_time desc limit 12',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
    
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.movie.push(results[index])
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 最新的12部连续剧
db.query('select * from video where  videoSort_id = 2  ORDER BY create_time desc limit 12',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
  
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Sitcom.push(results[index])
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 最新的12部综艺
db.query('select * from video where  videoSort_id = 3  ORDER BY create_time desc limit 12',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
  
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Variety.push(results[index])
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
// 最新的12部动漫
db.query('select * from video where  videoSort_id = 4  ORDER BY create_time desc limit 12',(error,results)=>{
    let timeId = [];
    let regionId  = [];
    let typeId = [];
    let videoId = [];
    let languageId = [];
    // for循环查询timeSort
   
    for(let index = 0;index<results.length;index++){
        // console.log(results[0].timeSort_id)
        timeId.push(results[index].timeSort_id)
        regionId.push(results[index].regionSort_id)
        typeId.push(results[index].typeSort_id)
        videoId.push(results[index].videoSort_id)
        languageId.push(results[index].language_id)
        // console.log(languageId)
        let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
        db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
        ,record,(error,resultTime)=>{
                if(error){
                    console.log(error,1)
                }else{
                    // console.log(resultTime,results[0].videoSort_id)
                 results[index].timeSort_id = resultTime[0].time_sort_name
                 results[index].regionSort_id = resultTime[0].region_sort_name
                 results[index].typeSort_id = resultTime[0].type_sort_name
                 results[index].videoSort_id = resultTime[0].video_sort_name
                 results[index].language_id = resultTime[0].language_name
                //  console.log(results[index].timeSort_id,1)
                }
                if(index>=results.length-1){
                    for(let index = 0;index<results.length;index++){
                        data.header.Comic.push(results[index])
                        // console.log(data.header.Recommend.recommendContent)
                    }
                }
        })
    }
    // console.log(data.header.Recommend.recommendHeader)
    // console.log(results) 
    // console.log()
    // for(let index = 0;index<results.length;index++){
    //     data.header.Recommend.recommendHeader.push(results[index])
    // }
   
})
db.query(navigationSql, (error,results)=>{
    if(error){
        res.json({
            code:400,
            error:error.message
        })
    }else {
    //    let  data = {
    //        header:{
    //         nav:[
    //             {
    //                 id:0,
    //                 name :'',
    //                 path:"",
    //                 sobObject:[
    //                 ]
    //             },
    //             {
    //                 id:0,
    //                 name :'',
    //                 path:"",
    //                 sobObject:[]
    //             },
    //             {
    //                 id:0,
    //                 name :'',
    //                 path:"",
    //                 sobObject:[]
    //             },
    //             {
    //                 id:0,
    //                 name :'',
    //                 path:"",
    //                 sobObject:[]
    //             }
    //         ],
    //         carousel:[],
    //         Recommend:{
    //             recommendHeader:[],

    //         },
    //     }}
         
        //  for循环添加数据
           for (let  index = 0; index < results.length; index++) {
            data.header.nav[index].id = results[index].video_sort_id;
            data.header.nav[index].name = results[index].video_sort_name;
            data.header.nav[index].path = results[index].video_sort_path;
           
            console.log( results[index].video_sort_id)
              db.query('select * from type_sort where video_sort_id = ?',results[index].video_sort_id,(error,result)=>{
                // console.log(result)
                for (let a = 0; a < result.length; a++) {
                    result[a]
                    data.header.nav[index].sobObject = result
                    // console.log('----');
                    // console.log(results.length,result.length);
                    // console.log(index >= results.length-1,a >= result.length-1)
                    // console.log(index,a);
                    // console.log(data.header.Recommend.recommendHeader)
                    if(index >= results.length-1 && a >= result.length-1){
                        res.json({
                            code:200,
                            data:data
                        })
                    }

                 }
                // data.header.nav[index].sobObject = [].concat(result)
                // console.log(0)
           })

           }
        //    console.log(1)
           
    }
})
})
const apiNames = 'selectVideo'
// 查询影片
router.get(`/${apiNames}/`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = req.query.type_sort_id 
    let video_sort_id = req.query.video_sort_id 
    let time_sort_id = req.query.time_sort_id 
    let region_sort_id = req.query.region_sort_id 
    let video_name = req.query.video_name 
    //  console.log(req.query.time_sort_id)
    let whereOne  =  ""
    let whereTwo  =  ""
    let whereThree  =  ""
    let whereFour  =  ""
    let whereFive  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    if(time_sort_id){
        whereThree = 'and timeSort_id = ?'
        data[data.length] =`${time_sort_id}`
    }
    if(region_sort_id){
        whereFour = 'and regionSort_id = ?'
        data[data.length] = `${region_sort_id}`
    }
    if(video_name){
        whereFive = 'and video_name like ?'
        data[data.length] = `${video_name}`
    }
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}${whereThree}${whereFour}${whereFive}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${whereThree}${whereFour}${whereFive} ${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        let   flag = false;

        if(results.length==0){
            res.json({
                        code:201,
                        message:'暂无当前分类影片'
                    })
        }
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    flag = true
                    if(index>=results.length-1){
                      
                        res.json({
                            code:200,
                            total:total,
                            data:results,  
                        })
                        return
                    }
            })
        }
       

    }) 
     })
})
// 点击电影返回所有电影数据
router.get(`/${apiName}/Movie`,(req,res)=>{
  // 接受前端参数
  let page = req.query.page || 1
  let page_size = req.query.page_size || 30
  let type_sort_id = req.query.type_sort_id 
  let video_sort_id = 1 

  let whereOne  =  ""
  let whereTwo  =  ""
  let data = []
  //   console.log(video_sort_id)
  if(video_sort_id){
      whereOne = 'where videoSort_id = ?'
      data[0] = `${video_sort_id}`
  }
  // console.log(data,0)
  if(type_sort_id){
      whereTwo = 'and typeSort_id = ?'
      data[data.length] = `${type_sort_id}`
  }
  
  //  翻页
  let offset = (page -1)*page_size
  let limit = `limit ${offset},${page_size}`
   
  // 查询
  let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
  db.query(sqlOne,data,(error,results)=>{
   // 总的记录数
   let total = results[0].total
  //  查询数据
  let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
  db.query(sqlTwo,data,(error,results)=>{
      let timeId = [];
      let regionId  = [];
      let typeId = [];
      let videoId = [];
      let languageId = [];
      // for循环查询timeSort
      
      for(let index = 0;index<results.length;index++){
          // console.log(results[0].timeSort_id)
          timeId.push(results[index].timeSort_id)
          regionId.push(results[index].regionSort_id)
          typeId.push(results[index].typeSort_id)
          videoId.push(results[index].videoSort_id)
          languageId.push(results[index].language_id)
          // console.log(languageId)
          let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
          db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
          ,record,(error,resultTime)=>{
                  if(error){
                      // console.log(error,1)
                  }else{
                      // console.log(resultTime)
                   results[index].timeSort_id = resultTime[0].time_sort_name
                   results[index].regionSort_id = resultTime[0].region_sort_name
                   results[index].typeSort_id = resultTime[0].type_sort_name
                   results[index].videoSort_id = resultTime[0].video_sort_name
                //    console.log(resultTime[0].video_language)
                   results[index].language_id = resultTime[0].language_name
                  //  console.log(results[index].timeSort_id,1)
                  }
                  if(index>=results.length-1){

                      res.json({
                          code:200,
                          total:total,
                          data:results
                      })
                  }
          })
      }
  }) 
   })
})
// 点击连续剧返回所有连续剧数据
router.get(`/${apiName}/Sitcom`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = req.query.type_sort_id 
    let video_sort_id = 2 
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                    //  console.log(resultTime[0].video_language)
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
  })
// 点击综艺返回所有的综艺数据 
router.get(`/${apiName}/Variety`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = req.query.type_sort_id 
    let video_sort_id = 3
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                    //  console.log(resultTime[0].video_language)
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击动漫返回所有的动漫数据
router.get(`/${apiName}/Comic`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = req.query.type_sort_id 
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击动作片返回所有的动作片数据
router.get(`/${apiName}/ActionMovie`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 1 
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击喜剧片返回所有的喜剧片数据
router.get(`/${apiName}/Comedy`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 2
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击爱情片返回所有的爱情片数据
router.get(`/${apiName}/Love`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 3
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击科幻片返回所有的科幻片数据
router.get(`/${apiName}/ScienceFiction`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 4
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击恐怖片返回所有的恐怖片数据
router.get(`/${apiName}/Horror`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 5
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击剧情片返回所有的剧情片数据
router.get(`/${apiName}/Plot`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 6
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击战争片返回所有的战争片数据
router.get(`/${apiName}/Warfare`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 7
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击纪录片返回所有的纪录片数据
router.get(`/${apiName}/Record`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 8
    let video_sort_id = 1
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击国产剧返回所有的国产剧数据
router.get(`/${apiName}/DomesticSeries`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 9
    let video_sort_id = 2
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击港台剧返回所有的港台剧数据
router.get(`/${apiName}/HtSeries`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 10
    let video_sort_id = 2
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
     
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击日韩剧返回所有的日韩剧数据
router.get(`/${apiName}/JkSeries`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 11
    let video_sort_id = 2
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击欧美剧返回所有的欧美剧数据
router.get(`/${apiName}/EaSeries`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 12
    let video_sort_id = 2
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击内地综艺返回所有的内地综艺数据
router.get(`/${apiName}/InlandVariety`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 13
    let video_sort_id = 3
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击港台综艺返回所有的港台综艺数据
router.get(`/${apiName}/HkVariety`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 14
    let video_sort_id = 3
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击日韩综艺返回所有的日韩综艺数据
router.get(`/${apiName}/JkVariety`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 15
    let video_sort_id = 3
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
      
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击欧美综艺返回所有的欧美综艺数据
router.get(`/${apiName}/EaVariety`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 16
    let video_sort_id = 3
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
        
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击国产动画返回所有的国产动画数据
router.get(`/${apiName}/DomesticAnimation`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 17
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
     
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击日韩动画返回所有的日韩动画数据
router.get(`/${apiName}/JkAnimation`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 18
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击欧美动画返回所有的欧美动画数据
router.get(`/${apiName}/EaAnimation`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 19
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
     
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击港台动画返回所有的港台动画数据
router.get(`/${apiName}/HkAnimation`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 20
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击海外动画返回所有的海外动画数据
router.get(`/${apiName}/OverseasAnimation`,(req,res)=>{
    // 接受前端参数
    let page = req.query.page || 1
    let page_size = req.query.page_size || 30
    let type_sort_id = 21
    let video_sort_id = 4
  
    let whereOne  =  ""
    let whereTwo  =  ""
    let data = []
    //   console.log(video_sort_id)
    if(video_sort_id){
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    // console.log(data,0)
    if(type_sort_id){
        whereTwo = 'and typeSort_id = ?'
        data[data.length] = `${type_sort_id}`
    }
    
    //  翻页
    let offset = (page -1)*page_size
    let limit = `limit ${offset},${page_size}`
     
    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}`
    db.query(sqlOne,data,(error,results)=>{
     // 总的记录数
     let total = results[0].total
    //  查询数据
    let sqlTwo = `select *  from video ${whereOne}${whereTwo}${limit}`
    db.query(sqlTwo,data,(error,results)=>{
        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
       
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                        // console.log(error,1)
                    }else{
                        // console.log(resultTime)
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    //  console.log(results[index].timeSort_id,1)
                    }
                    if(index>=results.length-1){
  
                        res.json({
                            code:200,
                            total:total,
                            data:results
                        })
                    }
            })
        }
    }) 
     })
})
// 点击影片进入详情
router.get(`/${apiName}/details/:id(\\d+)`,(req,res)=>{ 
    let id = req.params.id;
    let sql = 'select * from video where video_id = ?'
    let data = {
        video:[],
        RelatedVideos:[]
}

    db.query(sql,id,(error,results)=>{
        // console.log(results[0].typeSort_id)
        db.query('select * from video where typeSort_id =  ? and video_id !=? limit 9',[results[0].typeSort_id,id],(error,resultType)=>{
        // console.log(resultTime)
          for(let b=0;b<resultType.length;b++){
             data.RelatedVideos.push(resultType[b])
          }
        })

        let timeId = [];
        let regionId  = [];
        let typeId = [];
        let videoId = [];
        let languageId = [];
        // for循环查询timeSort
      
        for(let index = 0;index<results.length;index++){
            // console.log(results[0].timeSort_id)
            timeId.push(results[index].timeSort_id)
            regionId.push(results[index].regionSort_id)
            typeId.push(results[index].typeSort_id)
            videoId.push(results[index].videoSort_id)
            languageId.push(results[index].language_id)
            // console.log(languageId)
            let record = [timeId[index],regionId[index],typeId[index],videoId[index],languageId[index]]
            db.query('select(select time_sort_name from time_sort where time_sort_id =?)time_sort_name ,(select region_sort_name from region_sort where region_sort_id = ?)region_sort_name,(select type_sort_name from type_sort where type_sort_id = ?)type_sort_name,(select video_sort_name from video_sort where video_sort_id = ?)video_sort_name,(select language_name from video_language where language_id = ?)language_name'
            ,record,(error,resultTime)=>{
                    if(error){
                    }else{
                     results[index].timeSort_id = resultTime[0].time_sort_name
                     results[index].regionSort_id = resultTime[0].region_sort_name
                     results[index].typeSort_id = resultTime[0].type_sort_name
                     results[index].videoSort_id = resultTime[0].video_sort_name
                     
                     results[index].language_id = resultTime[0].language_name
                    }
                    data.video = results
                    if(index>=results.length-1){
                        res.json({
                            code:200,
                            data:data
                        })
                    }
            })
        }
    })
    
})
// 暴露
module.exports = router;