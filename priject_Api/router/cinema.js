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

// 首页初始化查询
router.get(`/${apiName}/`, (req, res) => {
    let navigationSql = 'select  video_sort_id,video_sort_name,video_sort_path from video_sort'
    db.query(navigationSql, (error, results) => {
        if (error) {
            res.json({
                code: 400,
                error: error.message
            })
        } else {
            let data = {
                header: {
                    nav: [
                        {
                            id: 0,
                            name: '',
                            sobObject: [
                            ]
                        },
                        {
                            id: 0,
                            name: '',
                            sobObject: []
                        },
                        {
                            id: 0,
                            name: '',
                            sobObject: []
                        },
                        {
                            id: 0,
                            name: '',
                            sobObject: []
                        }
                    ],
                }
            }

            //  for循环添加数据
            for (let index = 0; index < results.length; index++) {
                data.header.nav[index].id = results[index].video_sort_id;
                data.header.nav[index].name = results[index].video_sort_name;
                data.header.nav[index].path = results[index].video_sort_path;
                db.query('select * from type_sort where video_sort_id = ?', results[index].video_sort_id, (error, result) => {
                    for (let a = 0; a < result.length; a++) {
                        data.header.nav[index].sobObject.push(result[a]);
                        // console.log('----');
                        // console.log(results.length, result.length);
                        // console.log(index >= results.length - 1, a >= result.length - 1)
                        // console.log(index, a);
                        if (index >= results.length - 1 && a >= result.length - 1) {
                            res.json({
                                code: 200,
                                data: data
                             

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

// 查询影片
router.post(`/${apiName}`, (req, res) => {
    // 接受前端参数
    let page = req.body.page || 1
    let page_size = req.body.page_size || 5
    let type_sort_id = req.body.type_sort_id
    let video_sort_id = req.body.video_sort_id
    let time_sort_id = req.body.time_sort_id
    let region_sort_id = req.body.region_sort_id
    let video_name = req.body.video_name

    let whereOne = ""
    let whereTwo = ""
    let whereThree = ""
    let whereFour = ""
    let whereFive = ""
    let data = []
    // console.log(video_sort_id)
    if (video_sort_id) {
        whereOne = 'where videoSort_id = ?'
        data[0] = `${video_sort_id}`
    }
    if (type_sort_id) {
        whereTwo = 'and typeSort_id = ?'
        data[1] = `${type_sort_id}`
    }
    if (time_sort_id) {
        whereThree = 'and timeSort_id = ?'
        data[2] = `${time_sort_id}`
    }
    if (region_sort_id) {
        whereFour = 'and regionSort_id = ?'
        data[3] = `${region_sort_id}`
    }
    if (video_name) {
        whereFive = 'and video_name = ?'
        data[4] = `${video_name}`
    }
    //  翻页
    let offset = (page - 1) * page_size
    let limit = `limit ${offset},${page_size}`

    // 查询
    let sqlOne = `select count(*)total from video ${whereOne}${whereTwo}${whereThree}${whereFour}${whereFive}`
    db.query(sqlOne, data, (error, results) => {
        // 总的记录数
        // console.log(sqlOne, data)
        let total = results[0].total
        //  查询数据
        let sqlTwo = `select *  from video ${whereOne}${whereTwo}${whereThree}${whereFour}${whereFive} ${limit}`
        db.query(sqlTwo, data, (error, results) => {
            // console.log(results)
            res.json({
                code: 200,
                total: total,
                data: results
            })
        })
    })
})


// 暴露
module.exports = router;