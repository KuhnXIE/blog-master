const Mock = require('mockjs')


// 输出过滤项
var elFilterMap = {};

// 输出统计栏配置
var elAggrMap = {
  "name": "",
  "fullName": "",
  "createDate": "",
  "modifyDate": "",
  "orders": "",
  "grade": "",
  "treePath": ""
};

// 输出列表数据
const demoDataList = [
  {
    "id": "1",
    "name": "重庆",
    "fullName": "中国重庆市",
    "createDate": "2022-01-24 23:50:28",
    "modifyDate": "2022-01-25 23:50:28",
    "orders": 250,
    "grade": 182,
    "treePath": "树路径1"
  },
  {
    "id": "2",
    "name": "广州",
    "fullName": "中国广州市",
    "createDate": "2022-01-25 15:11:58",
    "modifyDate": "2022-01-26 15:11:58",
    "orders": 191,
    "grade": 892,
    "treePath": "树路径2"
  },
  {
    "id": "3",
    "name": "南宁",
    "fullName": "中国南宁市",
    "createDate": "2022-01-25 16:35:00",
    "modifyDate": "2022-01-26 16:35:00",
    "orders": 182,
    "grade": 57,
    "treePath": "树路径3"
  },
  {
    "id": "4",
    "name": "合肥",
    "fullName": "中国合肥市",
    "createDate": "2022-01-26 00:47:09",
    "modifyDate": "2022-01-27 00:47:09",
    "orders": 892,
    "grade": 598,
    "treePath": "树路径4"
  },
  {
    "id": "5",
    "name": "哈尔滨",
    "fullName": "中国哈尔滨市",
    "createDate": "2022-01-27 06:19:52",
    "modifyDate": "2022-01-28 06:19:52",
    "orders": 57,
    "grade": 476,
    "treePath": "树路径5"
  }
];

var demoFormData = {
  "id": "1",
  "name": "合肥",
  "fullName": "中国合肥市",
  "createDate": "2022-01-23 00:47:09",
  "modifyDate": "2022-01-24 00:47:09",
  "orders": 892,
  "grade": 598,
  "treePath": "树路径1"
};

module.exports = [
  {
    url: '/ez_user/area/list',
    type: 'get',
    response: config => {
      const items = demoDataList
      return {
        code: 20000,
        filterMap: elFilterMap,
        totalRow: elAggrMap,
        data: {
          total: items.length,
          items: items
        }
      }
    }
  },

  {
    url: '/ez_user/area/detail',
    type: 'get',
    response: config => {
      return {
        code: 20000,
        data: {
          detail: demoFormData
        }
      }
    }
  }
]
