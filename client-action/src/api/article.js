import axios from '@/utils/request'

export function list() {
  return axios({
    url: '/article/list',
    method: 'get'
  })
}

export function listPage(queryDto) {
  return axios({
    url: '/article/listPage',
    method: 'get',
    params:queryDto
  })
}

export function updateById(article) {
  return axios({
    url: '/article/update',
    method: 'post',
    data:article
  })
}

export function save(article) {
  return axios({
    url: '/article/save',
    method: 'post',
    data:article
  })
}

export function deleteById(id) {
  return axios({
    url: `/article/delete?id=${id}`,
    method: 'get'
  })
}
