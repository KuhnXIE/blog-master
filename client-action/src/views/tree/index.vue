<template>
  <div class="app-container">
    <el-input v-model="filterText" placeholder="查找关键词" style="margin-bottom:30px;" />

    <el-tree
      ref="tree2"
      :data="data2"
      :props="defaultProps"
      :filter-node-method="filterNode"
      class="filter-tree"
      default-expand-all
    />

  </div>
</template>

<script>
export default {

  data() {
    return {
      filterText: '',
      data2: [{
        id: 1,
        label: '层级一 1',
        children: [{
          id: 4,
          label: '层级二 1-1',
          children: [{
            id: 9,
            label: '层级三 1-1-1'
          }, {
            id: 10,
            label: '层级三 1-1-2'
          }]
        }]
      }, {
        id: 2,
        label: '层级一 2',
        children: [{
          id: 5,
          label: '层级二 2-1'
        }, {
          id: 6,
          label: '层级二 2-2'
        }]
      }, {
        id: 3,
        label: '层级一 3',
        children: [{
          id: 7,
          label: '层级二 3-1'
        }, {
          id: 8,
          label: '层级二 3-2'
        }]
      }],
      defaultProps: {
        children: 'children',
        label: 'label'
      }
    }
  },
  watch: {
    filterText(val) {
      this.$refs.tree2.filter(val)
    }
  },

  methods: {
    filterNode(value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    }
  }
}
</script>

