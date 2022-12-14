import axios from '@/utils/request'

export function list() {
  return axios({
    url: '/category/list',
    method: 'get'
  })
}

export function listPage(current, size , name) {
  return axios({
    url: `/category/listPage?pageCurrent=${current}&pageSize=${size}&name=${name}`,
    method: 'get'
  })
}


export function updateById(category) {
  /* var params = new URLSearchParams();
  params.append('id', category.id);
  params.append('categoryName', category.categoryName);
  return axios({
    url: '/category/update',
    method: 'post',
    params
  }) */
  return axios({
    url: '/category/update',
    method: 'post',
    data:category
  })
}

export function save(category) {
  return axios({
    url: '/category/save',
    method: 'post',
    data:category
  })
}

export function deleteById(id) {
  return axios({
    url: `/category/delete?id=${id}`,
    method: 'get'
  })
}

export function deleteBatchByIds(ids) {
  return axios({
    url: '/category/delete',
    method: 'post',
    data:ids
  })
}