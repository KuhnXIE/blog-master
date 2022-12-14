import Axios from "axios";
import {get,post} from "./http";

//============歌手相关================
//查询歌手
export const getAllSinger =() => get(`singer/allSinger`);
//根据性别查询歌手
export const getSingerOfSex = (sex) => get(`singer/singerOfSex?sex=${sex}`);

//============歌曲相关================
//根据歌手id查询歌曲
export const songOfSingerId =(id) => get(`/api/article/detail?id=${id}`);
//根据歌曲id查询歌曲对象
export const songOfSongId =(id) => get(`/api/article/detail?id=${id}`);
//根据歌手名字模糊查询歌曲
export const likeSongOfName =(keywords) => get(`song/likeSongOfName?songName=${keywords}`);

//============歌单相关================
//查询歌单
export const getAllSongList =() => post(`/api/article/list`);

export const searchArticleList =(name) => get(`/api/article/list?name=${name}`);
//返回标题包含文字的歌单列表
export const getSongListOfLikeTitle = (keywords) => get(`songList/likeTitle?title=${keywords}`);
//根据风格模糊查询歌单列表
export const getSongListOfLikeStyle = (currentPage,pageSize,name) => get(`/api/article/listPagePost?currentPage=${currentPage}&pageSize=${pageSize}&name=${name}`);


//============歌单的歌曲相关============
//根据歌单id查询歌曲列表
export const listSongDetail = (songListId) => get(`listSong/detail?songListId=${songListId}`);

//============用户相关================
//查询用户
export const getAllConsumer =() => get(`consumer/allConsumer`);
//注册
export const SignUp =(params) => post(`/api/user/clientSave`,params);
//登录
export const loginIn =(params) => post(`/api/user/login`,params);
//根据用户id查询该用户的详细信息
export const getUserOfId =(id) => get(`/api/user/userInfo?id=${id}`);
//更新用户信息
export const updateUserMsg =(params) => post(`/consumer/update`,params);

//下载音乐
export const download = (url)  => Axios({
    method: 'get',
    url: url,
    responseType: 'blob'
});

//===========评价======================
//提交评分
export const setRank =(params) => post(`/rank/add`,params);
//获取指定歌单的平均分
export const getRankOfSongListId = (songListId) => get(`/rank?songListId=${songListId}`);

//===========评论======================
//提交评论
export const setComment =(params) => post(`/comment/add`,params);
//点赞
export const setLike =(params) => post(`/comment/like`,params);
//返回当前歌单或歌曲的评论列表
export const getAllComment = (type,id) => {
    if(type == 0){              //歌曲
        return get(`/comment/commentOfSongId?songId=${id}`);
    }else{                      //歌单
        return get(`/comment/commentOfSongListId?songListId=${id}`);
    }
}

//===============收藏===================
//新增收藏
export const setCollect =(params) => post(`/collect/add`,params);
//指定用户的收藏列表
export const getCollectOfUserId = (userId) => get(`/collect/collectOfUserId?userId=${userId}`);