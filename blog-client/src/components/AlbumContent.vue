<template>
    <div class="content">
       <h1 class="title">
           <slot name="title"></slot>
           <hr/>
       </h1>
       <article v-html="item.articleContent" v-highlight class="markdown-body"></article>
       <!-- <ul>
           <li>
               <div class="song-item">
                   <span class="item-title">{{item.articleContent}}</span>
               </div>
           </li>
       </ul> -->
    </div>
</template>
<script>
import {mixin} from "../mixins";
export default {
    name: 'album-content',
    mixins: [mixin],
    props:[
        'item'
    ]
}
</script>

<style lang="scss" scoped>
@import '../assets/css/album-content.scss';
</style>