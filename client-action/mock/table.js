const Mock = require('mockjs')

const data = Mock.mock({
  'items|30': [{
    id: '@id',
    title: '标题@integer(1, 55) @sentence(3, 8)',
    'status|1': ['已发布', '草稿', '已删除'],
    author: '用户@integer(1, 55)',
    display_time: '@datetime',
    pageviews: '@integer(300, 5000)'
  }]
})

module.exports = [
  {
    url: '/table/list',
    type: 'get',
    response: config => {
      const items = data.items
      return {
        code: 20000,
        data: {
          total: items.length,
          items: items
        }
      }
    }
  }
]
