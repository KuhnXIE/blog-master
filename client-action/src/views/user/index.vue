<template>
    <div>
        <br />
        <el-row>
            <el-button type="primary" @click="handleOper()">新增</el-button>
            用户名称：<el-input size="mini" clearable v-model="queryDto.nickname" placeholder="请输入名称"></el-input>

            <el-button type="primary" @click="listPage()">搜索</el-button>
        </el-row>
        <hr />
        <el-table :data="user">
            <el-table-column prop="id" label="编号"></el-table-column>

            <el-table-column prop="email" label="邮箱"></el-table-column>
            <el-table-column prop="nickname" label="用户名"></el-table-column>
            <el-table-column prop="username" label="账号"></el-table-column>
            <el-table-column prop="lastLoginTime" label="最后登录时间"></el-table-column>
            <el-table-column prop="avatar" label="头像"></el-table-column>
            <el-table-column prop="intro" label="介绍"></el-table-column>
            <el-table-column prop="isDisable" label="是否启用"></el-table-column>

            <el-table-column fixed="right" label="操作" width="100">
                <template slot-scope="scope">
                    <el-button @click="updateById(scope.row)" type="text" size="small">修改</el-button>
                    <el-button @click="handleDlete(scope.row)" type="text" size="small">删除</el-button>
                    <el-button @click="handleUpdatePassword(scope.row)" type="text" size="small">修改密码</el-button>
                </template>

            </el-table-column>
        </el-table>

        <div class="block">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                :current-page="queryDto.pageCurrent" :page-sizes="[5, 10, 20, 50]" :page-size="queryDto.pageSize"
                layout="total, sizes, prev, pager, next, jumper" :total="total">
            </el-pagination>
        </div>

        <el-dialog width="33%" title="用户修改" :visible.sync="updateDialogVisible">
            <el-form>

                <el-form-item label="邮箱">
                    <el-input :readonly="false" v-model="updateForm.email"></el-input>
                </el-form-item>
                <el-form-item label="用户名">
                    <el-input :readonly="false" v-model="updateForm.nickname"></el-input>
                </el-form-item>
                <el-form-item label="账号">
                    <el-input :readonly="true" v-model="updateForm.username"></el-input>
                </el-form-item>
                <el-form-item label="头像">
                    <el-input :readonly="false" v-model="updateForm.avatar"></el-input>
                </el-form-item>
                <el-form-item label="介绍">
                    <el-input :readonly="false" v-model="updateForm.intro"></el-input>
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" @click="updateDialogVisible = false">取 消</el-button>
                    <el-button type="primary" @click="confirmUpdate(updateForm)">确 定</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

        <el-dialog width="44%" title="修改密码" :visible.sync="updatePasswordDialogVisible">
            <el-form>
                <el-form-item label="编号">
                    <el-input size="mini" :readonly="true" v-model="updatePasswordForm.id"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input size="mini" :readonly="false" v-model="updatePasswordForm.password"></el-input>
                </el-form-item>
                <el-form-item label="确认密码">
                    <el-input size="mini" :readonly="false" v-model="updatePasswordForm.confirmPassword"></el-input>
                </el-form-item>

                <el-form-item>

                    <el-button type="primary" size="mini" @click="updatePasswordDialogVisible = false">取 消</el-button>
                    <el-button type="primary" size="mini" @click="updatePassword(updatePasswordForm)">确 定</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

        <el-dialog width="38%" title="用户新增" :visible.sync="createDialogVisible">
            <el-form>
                <el-form-item label="邮箱">
                    <el-input size="mini" :readonly="false" v-model="createForm.email"></el-input>
                </el-form-item>
                <el-form-item label="用户名">
                    <el-input size="mini" :readonly="false" v-model="createForm.nickname"></el-input>
                </el-form-item>
                <el-form-item label="账号">
                    <el-input size="mini" :readonly="false" v-model="createForm.username"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input size="mini" :readonly="false" v-model="createForm.password"></el-input>
                </el-form-item>
                <el-form-item label="确认密码">
                    <el-input size="mini" :readonly="false" v-model="createForm.confirmPassword"></el-input>
                </el-form-item>
                <el-form-item label="头像">
                    <el-input size="mini" :readonly="false" v-model="createForm.avatar"></el-input>
                </el-form-item>
                <el-form-item label="介绍">
                    <el-input size="mini" :readonly="false" v-model="createForm.intro"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" size="mini" @click="createDialogVisible = false">取 消</el-button>
                    <el-button type="primary" size="mini" @click="confirmCreate(createForm)">确 定</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

    </div>
</template>
  
<script>
import { list, save, updateById, deleteById,listPage } from "@/api/user";
export default {
    async mounted() {
        this.listPage();
    },
    data() {
        return {
            user: [],
            updateDialogVisible: false,
            updateForm: {
                id: 0,
                email: '',
                nickname: '',
                username: '',
                avatar: '',
                intro: ''
            },
            createDialogVisible: false,
            createForm: {
                email: '',
                nickname: '',
                username: '',
                password: '',
                confirmPassword: '',
                avatar: '',
                intro: ''
            },
            updatePasswordDialogVisible: false,
            updatePasswordForm: {
                id: 0,
                password: '',
                confirmPassword: ''
            },
            queryDto: {
                pageCurrent: 1,
                pageSize: 5,
                nickname: ''
            },
            total:0
        }
    },
    methods: {
        async handleDlete(row) {
            try {
                await this.$confirm('此操作将永久删除该, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                })
                await deleteById(row.id)
                this.listPage();
            } catch (error) {
                console.log("取消删除！");
            }
        },
        handleUpdatePassword(row) {
            this.updatePasswordDialogVisible = true;
            this.updatePasswordForm = { ...row }
        },
        async handleOper() {
            this.createDialogVisible = true
        },
        updateById(row) {
            this.updateDialogVisible = true
            // this.updateForm = row
            this.updateForm = { ...row }
        },
        async updatePassword(row) {
            this.checkPassword(this.updatePasswordForm.password, this.updatePasswordForm.confirmPassword)
            await updateById(this.updatePasswordForm);
            this.updatePasswordDialogVisible = false
            this.listPage()
        },
        async confirmUpdate(row) {
            await updateById(row)
            this.updateDialogVisible = false
            this.listPage()
        },
        async confirmCreate(row) {
            await save(row)
            this.createDialogVisible = false
            this.listPage()
        },
        async all() {
            const { data } = await list();
            this.user = data
        },
        handleCurrentChange(page) {
            this.queryDto.pageCurrent = page
            this.listPage()
        },
        handleSizeChange(size) {
            this.queryDto.pageSize = size
            this.listPage()
        },
        checkPassword(password, confirmPassword) {
            if (password !== confirmPassword) {
                throw new Error("两次密码不相同！");
            }
        },
        async listPage() {
            const { data } = await listPage(this.queryDto);
            // this.category = page
            this.user = data.records
            this.total = data.total
        }
    }
};
</script>
  
<style scoped>
.el-input--mini,
.el-select--mini {
  width: 193px;
  margin: 10px 10 px 0 0;
}
</style>