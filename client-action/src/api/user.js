import axios from '@/utils/request'

export function login(data) {
  return axios({
    url: '/user/login',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return axios({
    url: '/user/info',
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return axios({
    url: '/user/logout',
    method: 'post'
  })

}


export function list() {
  return axios({
    url: '/user/list',
    method: 'get'
  })
}

export function listPage(queryDto) {
  return axios({
    url: '/user/listPage',
    method: 'get',
    params: queryDto
  })
}

export function updateById(user) {
  return axios({
    url: '/user/update',
    method: 'post',
    data: user
  })
}

export function save(user) {
  return axios({
    url: '/user/save',
    method: 'post',
    data: user
  })
}

export function deleteById(id) {
  return axios({
    url: `/user/delete?id=${id}`,
    method: 'get'
  })
}
